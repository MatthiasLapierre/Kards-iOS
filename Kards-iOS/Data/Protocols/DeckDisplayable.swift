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

protocol DeckDisplayable  {
    var id: String { get }
    var updatedAt: String { get }
    var name: String { get }
    var mainNation: String { get }
    var secondNation: String { get }
    var score: String { get }    
    var mainNationCards: Int { get }
    var secondNationCards: Int { get }
    var username: String { get }
    var backgroundColor: Color { get }
    var image: Image { get }
    var information: [Information] { get }
}

struct Information {
    var title: String
    var text: String
}

class PreviewDeck: DeckDisplayable {
    var id: String = "1"
    
    var updatedAt: String = "10/12/2020"
    
    var name: String = "Blitzkrieg"
    
    var mainNation: String = "Germany"
    
    var secondNation: String = "France"
    
    var score: String = "+3"
    
    var mainNationCards: Int = 12
    
    var secondNationCards: Int = 11
    
    var username: String = "Paul"
    
    var backgroundColor: Color = Nation(rawValue: 4)!.backgroundColor
    
    var image: Image = Nation(rawValue: 4)!.image
    
    var information: [Information] {
        return [
            Information(title: String.deckOwner, text: username),
            Information(title: String.deckUpdated, text: updatedAt),
            Information(title: String.deckViews, text: "3"),
            Information(title: String.deckGameVersion, text: "Breakthrough"),
            Information(title: String.deckResourceCost, text: "1860"),
            Information(title: String.deckCardBreakdown, text: "Germany (12) France (11)")
        ]
    }
}
