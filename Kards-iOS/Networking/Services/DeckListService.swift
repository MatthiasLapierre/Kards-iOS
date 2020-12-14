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

class DeckListService: Service {
    
    // MARK:- Internal
    func decks(
        page: Int = 1,
        mainNations: Set<Nation>? = nil,
        alliedNations: Set<Nation>? = nil,
        query: String? = nil,
        sortBy: DeckSortType? = nil,
        completion: @escaping (_ response: Result<GetDecksQuery.Data.Deck, KardsAPIError>) -> Void
    ) {
        let offset = (page - 1) * Int.pageLimit
        self.networkClient.graphQLClient.fetch(
            query: GetDecksQuery(
                language: "en",
                offset: offset,
                main: mainNations?.map { $0.rawValue } ?? nil,
                ally: alliedNations?.map { $0.rawValue } ?? nil,
                q: query,
                sortBy: sortBy,
                order: .desc)
        ) { result in
            switch result {
            case .failure(let error):
                print("Something bad happened \(error)")
                completion(.failure(.processingError(error)))
            case .success(let graphQLResult):
                guard let cards = graphQLResult.data?.decks else {
                    print("No card")
                    completion(.failure(.noData))
                    return
                }
                completion(.success(cards))
            }
        }
    }
    
}
