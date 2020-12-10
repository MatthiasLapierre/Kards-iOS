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

struct CardViewModel: CardDisplayable, Identifiable {
    
    var id: String {
        "\(card.id)"
    }
    
    var title: String {
        return (card.json["title"] as? [String:String])?["en"] ?? ""
    }
    
    var subTitle: String {
        return card.json["faction"] as? String ?? ""
    }
    
    var imageUrl: String {
        return card.imageUrl
    }
    
    var text: String {
        return (card.json["text"] as? [String:String])?["en"] ?? ""
    }
    
    var features: [Feature] {
        let nation = card.json["faction"] as! String
        let rarity = card.json["rarity"] as! String
        let type = card.json["type"] as! String
        let kcredits = card.json["kredits"] as! Int
        let set = card.json["set"] as! String
        return [
            Feature(title: String.cardNation, value: nation),
            Feature(title: String.cardRarity, value: rarity),
            Feature(title: String.cardType, value: type),
            Feature(title: String.cardKredits, value: "\(kcredits)"),
            Feature(title: String.cardSet, value: set)
        ]
    }
    
    private let card: GetCardsQuery.Data.Card.Edge.Node
    
    init(card: GetCardsQuery.Data.Card.Edge.Node) {
        self.card = card
    }
    
}
