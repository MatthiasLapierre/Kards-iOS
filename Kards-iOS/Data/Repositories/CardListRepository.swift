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

class CardListRepository: ObservableObject, CardPaginatable {            
    
    //MARK: - Data source
    @Published var elements: [CardDisplayable] = []
    @Published var state: DataState = .initial
    
    //MARK: - Services
    let service: CardListService
    
    //MARK: - Filters
    let filters: CardFilters
    
    //MARK: - State
    var isEmpty: Bool {
        elements.isEmpty
    }
    var isLoading: Bool {
        return state == .loading || state == .loadingAdditional
    }
    
    //MARK: - Paging
    private (set) var currentPage: Int = 1
    private (set) var hasNextPage: Bool = false
    
    //MARK: - Initializers
    init(service: CardListService, filters: CardFilters) {
        self.service = service
        self.filters = filters
    }
    
    //MARK: - CardPaginatable
    
    func loadMore() {
        print("Loading more cards")
        
        if state == .loading || state == .loadingAdditional {
          return
        }
        
        guard elements.isEmpty || hasNextPage else {
          return
        }
        
        state = .loadingAdditional
        currentPage += 1
        
        print("Current page: \(currentPage)")
        
        service.cards(
            page: currentPage,
            nations: filters.nations,
            kredits: filters.kredits,
            types: filters.types,
            rarity: filters.rarity,
            set: filters.set,
            query: filters.query
        ) { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let cards):
                let viewModels = cards.edges?.compactMap { edge -> CardViewModel? in
                    if let node = edge?.node {
                        return CardViewModel(card: node)
                    } else {
                        return nil
                    }
                } ?? []
                print("Gotten \(viewModels.count) cards")
                self.elements += viewModels
                self.hasNextPage = cards.pageInfo.hasNextPage
                self.state = DataState.hasData
            case .failure(let error):
                self.currentPage -= 1
                self.state = DataState.failed(error)
                print("Failed to load more cards : \(error)")
            }
        }
    }
    
    func reload() {
        if state == .loading || state == .loadingAdditional {
          return
        }
        
        state = .loading
        
        // Reset current page to 1
        currentPage = startingPage
        
        service.cards(
            page: currentPage,
            nations: filters.nations,
            kredits: filters.kredits,
            types: filters.types,
            rarity: filters.rarity,
            set: filters.set,
            query: filters.query
        ) { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .success(let cards):
                let viewModels = cards.edges?.compactMap { edge -> CardViewModel? in
                    if let node = edge?.node {
                        return CardViewModel(card: node)
                    } else {
                        return nil
                    }
                } ?? []
                self.elements = viewModels
                self.hasNextPage = cards.pageInfo.hasNextPage
                self.state = DataState.hasData
            case .failure(let error):
                self.state = DataState.failed(error)
                print("Failed to reload cards : \(error)")
            }
        }
    }
    
}
