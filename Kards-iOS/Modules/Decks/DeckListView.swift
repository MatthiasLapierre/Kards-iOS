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

struct DeckListView: View {
    
    @ObservedObject private var deckListRepository: DeckListRepository
    @State private var isLoading: Bool = false
    @State private var selectedDeck: DeckViewModel? = nil
    @State private var presentCard: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(deckListRepository: DeckListRepository) {
        self.deckListRepository = deckListRepository
    }
    
    var body: some View {
        contentView
            .navigationBarTitle(
                Text(String.decks),
                displayMode: .inline
            )
            .onAppear {
                reloadIfRequired()
            }
            .onReceive(self.deckListRepository.objectWillChange) {
                isLoading = self.deckListRepository.isLoading
            }
    }
    
    @ViewBuilder private var contentView: some View {
        switch deckListRepository.state {
        case .initial, .loading:
            loadingView
        case .hasData where deckListRepository.isEmpty:
          noResultsView
        case .failed where deckListRepository.isEmpty:
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
                    decksView
                    loadMoreView
                    // Hack to make sure there's some spacing at the bottom of the list
                    Color.backgroundColor
                }
            }
        }
    }
    
    private var decksView: some View {
        LazyVStack(spacing: 1) {
            ForEach(deckListRepository.decks, id: \.id, content: deckItem)
        }
        .padding(.all, 8)
    }
    
    private var reloadView: some View {
        ZStack {
            backgroundView
            ReloadView(
                isLoading: $isLoading,
                reloadHandler: deckListRepository.reload
            )
        }
    }
    
    @ViewBuilder private var loadMoreView: some View {
        if deckListRepository.hasNextPage {
            LoadMoreView(
                isLoading: $isLoading,
                callback: deckListRepository.loadMore
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
    
    private func deckItem(for content: DeckDisplayable) -> some View {
        Button(action: {
            selectedDeck = content as? DeckViewModel
        }, label: {
            DeckItemView(deck: content)
        })
        .onAppear(perform: {
            if (content.id == deckListRepository.decks.last?.id) {
                deckListRepository.loadMore()
            }
        })
    }
    
    private func reloadIfRequired() {
      if deckListRepository.state == .initial {
        deckListRepository.reload()
      }
    }
}
