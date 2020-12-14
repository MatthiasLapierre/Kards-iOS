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

import Foundation

class CardListService: Service {
    
    func cards(
        page: Int = 1,
        nations: Set<Nation>? = nil,
        kredits: Set<Int>? = nil,
        types: Set<CardType>? = nil,
        rarity: Set<CardRarity>? = nil,
        set: CardSet? = nil,
        query: String? = nil,
        completion: @escaping (_ response: Result<GetCardsQuery.Data.Card, KardsAPIError>) -> Void
    ) {
        let offset = (page - 1) * Int.pageLimit
        let query = GetCardsQuery(
            language: "en",
            offset: offset,
            nationIds: normalize(nations: nations),
            kredits: normalize(kredits: kredits),
            q: query,
            type: normalize(types: types),
            rarity: normalize(rarity: rarity),
            set: normalize(set: set),
            showSpawnables: true
        )
        self.networkClient.graphQLClient.fetch(query: query) { result in
            switch result {
            case .failure(let error):
                print("Something bad happened \(error)")
                completion(.failure(.processingError(error)))
            case .success(let graphQLResult):
                guard let cards = graphQLResult.data?.cards else {
                    print("No card")
                    completion(.failure(.noData))
                    return
                }                
                completion(.success(cards))
            }
        }
    }
    
    private func normalize(nations: Set<Nation>?) -> [Int]? {
        var nationIds: [Int]? = nil
        if let nations = nations, nations.count > 0 {
            nationIds = nations.map { $0.rawValue }
        }
        return nationIds
    }
    
    private func normalize(kredits: Set<Int>?) -> [Int]? {
        var result: [Int]? = nil
        if let kredits = kredits, kredits.count > 0 {
            result = Array(kredits)
        }
        return result
    }
    
    private func normalize(types: Set<CardType>?) -> [String]? {
        var result: [String]? = nil
        if let types = types, types.count > 0 {
            result = types.map { $0.rawValue }
        }
        return result
    }
    
    private func normalize(set: CardSet?) -> [String]? {
        var result: [String]? = nil
        if let set = set, set != CardSet.All {
            result = [set.rawValue]
        }
        return result
    }
    
    private func normalize(rarity: Set<CardRarity>?) -> [String]? {
        var result: [String]? = nil
        if let rarity = rarity, rarity.count > 0 {
            result = rarity.map { $0.rawValue }
        }
        return result
    }
    
}
