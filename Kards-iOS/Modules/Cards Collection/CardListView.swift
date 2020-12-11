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
    
    @ObservedObject private var cardListRepository: CardListRepository
    @State private var isLoading: Bool = false
    @State private var selectedCard: CardViewModel? = nil
    @State private var presentCard: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(cardListRepository: CardListRepository) {
        self.cardListRepository = cardListRepository
    }
    
    var body: some View {
        contentView
            .onAppear {
                reloadIfRequired()
            }
            .onReceive(self.cardListRepository.objectWillChange) {
                isLoading = self.cardListRepository.isLoading
            }
    }
    
    @ViewBuilder private var contentView: some View {
        switch cardListRepository.state {
        case .initial, .loading:
            loadingView
        case .hasData where cardListRepository.isEmpty:
          noResultsView
        case .failed where cardListRepository.isEmpty:
          reloadView
        case .hasData, .loadingAdditional, .failed:
          listView
        }
    }
    
    private var listView: some View {
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
    
    private var cardsView: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: .cardWidth))]) {
            ForEach(cardListRepository.cards, id: \.id, content: cardItem)
        }
        .padding(.all, 8)
    }
    
    private var reloadView: some View {
        ZStack {
            backgroundView
            ReloadView(
                isLoading: $isLoading,
                reloadHandler: cardListRepository.reload
            )
        }
    }
    
    @ViewBuilder private var loadMoreView: some View {
        if cardListRepository.hasNextPage {
            LoadMoreView(
                isLoading: $isLoading,
                callback: cardListRepository.loadMore
            )
        }
    }
    
    private var backgroundView: some View {
        BackgroundView()
    }
    
    private var loadingView: some View {
        ZStack {
            backgroundView
            LoadingView()
        }
    }
    
    private var noResultsView: some View {
        ZStack {
            backgroundView
            NoResultsView(
                title: String.noCardsTitle,
                message: String.noCardsMessage
            )
        }
    }
    
    private func cardItem(for content: CardDisplayable) -> some View {
        Button(action: {
            selectedCard = content as? CardViewModel
        }) {
            CardImageView(content.imageUrl)
        }
        .onAppear(perform: {
            if (content.id == cardListRepository.cards.last?.id) {
                cardListRepository.loadMore()
            }
        })
        .fullScreenCover(item: $selectedCard, content: { item in
            ClosableView {
                CardDetailsView(card: item)
            }
        })
    }
    
    private func reloadIfRequired() {
      if cardListRepository.state == .initial {
        cardListRepository.reload()
      }
    }
    
}
