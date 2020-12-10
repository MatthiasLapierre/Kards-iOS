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
import SwiftUI

struct DeckViewModel: DeckDisplayable, Identifiable {
    
    var id: String {
        "\(deck.id)"
    }
    
    var updatedAt: String {
        let unixtimeInterval: TimeInterval = (Double(deck.updatedAt)! / 1000.0)
        let date = Date(timeIntervalSince1970: unixtimeInterval)
        return date.timeAgo(numericDates: true)
    }
    
    var name: String {
        deck.name
    }
    
    var mainNation: String {
        deck.mainNation.name
    }
    
    var secondNation: String {
        deck.allyNation.name
    }
    
    var score: String {
        let score = deck.score.score
        if score > 0 {
            return "+\(score)"
        } else if score < 0 {
            return "-\(score)"
        } else {
            return "0"
        }
    }
    
    var mainNationCards: Int {
        Int(deck.stats?.filter { $0?.key == mainNation }.first??.value ?? "") ?? 0
    }
    
    var secondNationCards: Int {
        Int(deck.stats?.filter { $0?.key == secondNation }.first??.value ?? "") ?? 0
    }
    
    var username: String {
        deck.user.username ?? ""
    }
    
    var backgroundColor: Color {
        Nation.init(rawValue: deck.mainNation.id)?.backgroundColor ?? Color.clear
    }
    
    var image: Image {
        Nation.init(rawValue: deck.mainNation.id)?.image ?? Image.soviet
    }
    
    var information: [Information] {
        var resources: Int {
            deck.resources ?? 0
        }
        
        var views: Int {
            deck.views ?? 0
        }
        
        var orders: Int {
            Int(deck.stats?.filter { $0?.key == "orders" }.first??.value ?? "") ?? 0
        }
        
        var counterMeasures: Int {
            Int(deck.stats?.filter { $0?.key == "countermeasures" }.first??.value ?? "") ?? 0
        }
        
        var units: Int {
            Int(deck.stats?.filter { $0?.key == "units" }.first??.value ?? "") ?? 0
        }
        
        return [
            Information(title: String.deckOwner, text: username),
            Information(title: String.deckUpdated, text: updatedAt),
            Information(title: String.deckViews, text: "👀 \(views)"),
            Information(title: String.deckGameVersion, text: "Breakthrough"),
            Information(title: String.deckResourceCost, text: "🔨 \(resources)"),
            Information(title: String.cardBreakdown, text: "Orders (\(orders)) ; Units (\(units)) ; \(mainNation) (\(mainNationCards)) ; \(secondNation) (\(secondNationCards))")
        ]
    }
    
    private let deck: GetDecksQuery.Data.Deck.Edge.Node
    
    init(deck: GetDecksQuery.Data.Deck.Edge.Node) {
        self.deck = deck
    }
    
}
