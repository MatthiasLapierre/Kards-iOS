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
    
    @ObservedObject private var repository: DeckListRepository
    @State private var isLoading: Bool = false
    @State private var selectedDeck: DeckViewModel? = nil
    @State private var presentCard: Bool = false
    @State private var showFilters: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(repository: DeckListRepository) {
        self.repository = repository
    }
    
    var body: some View {
        contentView
            .navigationBarTitle(
                Text(String.decks),
                displayMode: .inline
            )
            .navigationBarItems(
                trailing: trailingNavigationBarButtonView
                    .fullScreenCover(isPresented: $showFilters, content: {
                        ClosableView(dismiss: {
                            repository.reload()
                        }) {
                            DeckFiltersView(
                                viewModel: DeckFiltersViewModel(filters: DataManager.current.filtersManager.deckFilters)
                            )
                        }
                    })
            )
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
private extension DeckListView {
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
    
    var trailingNavigationBarButtonView: some View {
        Button(
            String.filters,
            action: {
                self.showFilters = true
            }
        )
        .font(.uiButtonLabel)
        .foregroundColor(.titleText)
    }
    
    var listView: some View {
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
    
    var decksView: some View {
        LazyVStack(spacing: 1) {
            ForEach(repository.elements, id: \.id, content: deckItem)
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
    
    func deckItem(for content: DeckDisplayable) -> some View {
        Button(action: {
            selectedDeck = content as? DeckViewModel
        }, label: {
            DeckItemView(deck: content)
        })
        .onAppear(perform: {
            if (content.id == repository.elements.last?.id) {
                repository.loadMore()
            }
        })
        .fullScreenCover(item: $selectedDeck, content: { item in
            ClosableView {
                DeckDetailsView(deck: item)
            }
        })
    }
    
    func reloadIfRequired() {
      if repository.state == .initial {
        repository.reload()
      }
    }
}
