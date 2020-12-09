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
import KingfisherSwiftUI

struct CardListView: View {
    
    @ObservedObject private var cardListRepository: CardListRepository
    @State private var isLoading: Bool = false
    
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
    
    @ViewBuilder var contentView: some View {
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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: .cardWidth))]) {
            ForEach(cardListRepository.cards, id: \.id, content: cardItem)
        }
        .padding(.all, 8)
    }
    
    var reloadView: some View {
        ZStack {
            backgroundView
            ReloadView(reloadHandler: cardListRepository.reload)
        }
    }
    
    @ViewBuilder var loadMoreView: some View {
        if cardListRepository.hasNextPage {
            LoadMoreView(
                isLoading: $isLoading,
                callback: cardListRepository.loadMore
            )
        }
    }
    
    var backgroundView: some View {
        Color.backgroundColor
            .edgesIgnoringSafeArea(.all)
            .overlay(
                Image.overlay1Background
                    .resizable()
                    .scaledToFill()
            )
            .overlay(
                Image.overlay2Background
                    .resizable()
                    .scaledToFill()
            )
            .overlay(
                Image.overlay3Background
                    .resizable()
                    .scaledToFill()
            )
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
        NavigationLink(
            destination: Text("Destination"),
            label: {
                KFImage(URL(string: "\(KardsAPI.shared.environment.baseURL)/\(content.imageUrl)"))
                    .placeholder {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .font(.uiLargeTitle)
                            .foregroundColor(Color.bodyText)
                            .opacity(0.3)
                    }
                    .resizable()
                    .scaledToFit()
            })
            .onAppear(perform: {
                if (content.id == cardListRepository.cards.last?.id) {
                    cardListRepository.loadMore()
                }
            })
    }
    
    func reloadIfRequired() {
      if cardListRepository.state == .initial {
        cardListRepository.reload()
      }
    }
    
}
