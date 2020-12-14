// Copyright (c) 2020 Matthias Lapierre
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
// distribute, sublicense, create a derivative work, and/or sell copies of the
// Software in any work that is designed, intended, or marketed for pedagogical or
// instructional purposes related to programming, coding, application development,
// or information technology.  Permission for such use, copying, modification,
// merger, publication, distribution, sublicensing, creation of derivative works,
// or sale is expressly withheld.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import SwiftUI
import Combine
import KingfisherSwiftUI

struct CardListView: View {
    
    @ObservedObject private var repository: CardListRepository
    @State private var isLoading: Bool = false
    @State private var selectedCard: CardViewModel? = nil
    @State private var presentCard: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    //MARK: - Initializers
    init(repository: CardListRepository) {
        self.repository = repository
    }
    
    var body: some View {
        contentView
            .onAppear {
                reloadIfRequired()
            }
            .onChange(of: repository.state, perform: { state in
                if case DataState.failed(let error) = state {
                    MessageBus.current.post(message: Message(level: .error, message: error.localizedDescription))
                }
                isLoading = repository.isLoading
            })            
    }
    
}

// MARK: - Private
private extension CardListView {
    @ViewBuilder var contentView: some View {
        switch repository.state {
        case .initial, .loading:
            loadingView
        case .hasData where repository.isEmpty:
          noResultsView
        case .failed where repository.isEmpty:
          reloadView
        case .hasData, .loadingAdditional, .failed:
          listView
        }
    }
    
    var listView: some View {
        ZStack {
            backgroundView
            ScrollView {
                Group {
                    cardsView
                    loadMoreView
                    // Hack to make sure there's some spacing at the bottom of the list
                    Color.backgroundColor
                }
            }
        }
    }
    
    var cardsView: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: .cardThumbWidth))]) {
            ForEach(repository.elements, id: \.id, content: cardItem)
        }
        .padding(.all, 8)
    }
    
    var reloadView: some View {
        ZStack {
            backgroundView
            ReloadView(
                isLoading: $isLoading,
                reloadHandler: repository.reload
            )
        }
    }
    
    @ViewBuilder var loadMoreView: some View {
        if repository.hasNextPage {
            LoadMoreView(
                isLoading: $isLoading,
                callback: repository.loadMore
            )
        }
    }
    
    var backgroundView: some View {
        BackgroundView()
    }
    
    var loadingView: some View {
        ZStack {
            backgroundView
            LoadingView()
        }
    }
    
    var noResultsView: some View {
        ZStack {
            backgroundView
            NoResultsView(
                title: String.noCardsTitle,
                message: String.noCardsMessage
            )
        }
    }
    
    func cardItem(for content: CardDisplayable) -> some View {
        Button(action: {
            selectedCard = content as? CardViewModel
        }) {
            CardImageView(content.imageUrl)
        }
        .onAppear(perform: {
            if (content.id == repository.elements.last?.id) {
                repository.loadMore()
            }
        })
        .fullScreenCover(item: $selectedCard, content: { item in
            ClosableView {
                CardDetailsView(card: item)
            }
        })
    }
    
    func reloadIfRequired() {
      if repository.state == .initial {
        repository.reload()
      }
    }
}
