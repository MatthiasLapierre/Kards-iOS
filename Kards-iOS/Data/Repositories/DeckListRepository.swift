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

import Combine

class DeckListRepository: ObservableObject, DeckPaginatable {
    
    let service: DeckListService
    let filters: DeckFilters
    
    private (set) var currentPage: Int = 1
    private (set) var hasNextPage: Bool = false
    
    var decks: [DeckDisplayable] = [] {
      willSet {
        objectWillChange.send()
      }
    }
    
    var state: DataState = .initial
    
    var isEmpty: Bool {
      decks.isEmpty
    }
    
    var isLoading: Bool {
        return state == .loading || state == .loadingAdditional
    }
    
    init(service: DeckListService, filters: DeckFilters) {
        self.service = service
        self.filters = filters
    }
    
    func loadMore() {
        print("Loading more cards")
        
        if state == .loading || state == .loadingAdditional {
          return
        }
        
        guard decks.isEmpty || hasNextPage else {
          return
        }
        
        state = .loadingAdditional
        currentPage += 1
        
        print("Current page: \(currentPage)")
        
        service.decks(
            page: currentPage,
            mainNations: filters.mainNation,
            alliedNations: filters.alliedNation,
            query: filters.query,
            sortBy: filters.sortBy
        ) { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let decks):
                let viewModels = decks.edges?.compactMap { edge -> DeckViewModel? in
                    if let node = edge?.node {
                        return DeckViewModel(deck: node)
                    } else {
                        return nil
                    }
                } ?? []
                print("Gotten \(viewModels.count) cards")
                self.decks += viewModels
                self.hasNextPage = decks.pageInfo.hasNextPage
                self.state = DataState.hasData
            case .failure(let error):
                self.currentPage -= 1
                self.state = DataState.failed
                self.objectWillChange.send()
                print("Failed to load more cards : \(error)")
            }
        }
    }
    
    func reload() {
        if state == .loading || state == .loadingAdditional {
          return
        }
        
        state = .loading
        
        objectWillChange.send()
        
        // Reset current page to 1
        currentPage = startingPage
        
        service.decks(
            page: currentPage,
            mainNations: filters.mainNation,
            alliedNations: filters.alliedNation,
            query: filters.query,
            sortBy: filters.sortBy
        ) { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let decks):
                let viewModels = decks.edges?.compactMap { edge -> DeckViewModel? in
                    if let node = edge?.node {
                        return DeckViewModel(deck: node)
                    } else {
                        return nil
                    }
                } ?? []
                self.decks = viewModels
                self.hasNextPage = decks.pageInfo.hasNextPage
                self.state = DataState.hasData
            case .failure(let error):
                self.state = DataState.failed
                self.objectWillChange.send()
                print("Failed to reload cards : \(error)")
            }
        }
    }
    
}
