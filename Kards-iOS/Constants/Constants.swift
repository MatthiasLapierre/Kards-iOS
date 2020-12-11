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

extension Int {
    static let pageLimit: Int = 20
}

extension CGFloat {
    static let cardWidth: CGFloat = 120
}

extension TimeInterval {
    // MARK: Message Banner
    static let autoDismissTime: Self = 3
}

extension String {
    static let cardsCollection = "Cards"
    static let decks = "Decks"
    static let deck = "Deck"
    static let loading = "Loading…"
    static let learnMore = "Lear more"
    static let loadMore = "Load more"
    static let reload = "Reload"
    
    //MARK: Card details
    static let cardNation = "Nation"
    static let cardRarity = "Rarity"
    static let cardType = "Type"
    static let cardKredits = "Kredits"
    static let cardSet = "Set"
    
    //MARK: Deck details
    static let deckOwner = "Owner"
    static let deckUpdated = "Updated"
    static let deckViews = "Views"
    static let deckGameVersion = "Game Version"
    static let deckResourceCost = "Resource cost"
    static let cardBreakdown = "Card breakdown"
    
    // MARK: Empty views
    static let noCardsTitle = "We couldn't find anything"
    static let noCardsMessage = "Try removing some filters."
    static let tryAgainTitle = "Something went wrong."
    static let tryAgainMessage = "Please, try again."
}
