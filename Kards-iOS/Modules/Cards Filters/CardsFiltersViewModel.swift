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
import Combine

class CardsFiltersViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var cardFilters: CardFilters
    
    var nations: [Nation] {
        return [
            Nation.SovietUnion,
            Nation.UnitedState,
            Nation.Japan,
            Nation.Germany,
            Nation.Britain,
            Nation.France,
            Nation.Italy
        ]
    }
    
    var types: [CardType] {
        return [
            CardType.Infantry,
            CardType.Artillery,
            CardType.Tank,
            CardType.Bomber,
            CardType.Fighter,
            CardType.Order,
            CardType.CounterMeasure
        ]
    }
    
    var rarityArray: [CardRarity] {
        return [
            CardRarity.Elite,
            CardRarity.Special,
            CardRarity.Limited,
            CardRarity.Standard
        ]
    }
    
    var sets: [CardSet] {
        return [
            CardSet.All,
            CardSet.Base,
            CardSet.Allegiance,
            CardSet.TheatersOfWar,
            CardSet.Breakthrough
        ]
    }
    
    // MARK: - Initializers
    
    init(filters: CardFilters) {
        self.cardFilters = filters
    }
    
    // MARK: - Handle events
    
    func pressNation(_ nation: Nation) {
        if cardFilters.nations.contains(nation) {
            cardFilters.nations.remove(nation)
        } else {
            cardFilters.nations.insert(nation)
        }
        objectWillChange.send()
    }
    
    func pressKredits(_ kredits: Int) {
        if cardFilters.kredits.contains(kredits) {
            cardFilters.kredits.remove(kredits)
        } else {
            cardFilters.kredits.insert(kredits)
        }
        objectWillChange.send()
    }
    
    func pressCardType(_ type: CardType) {
        if cardFilters.types.contains(type) {
            cardFilters.types.remove(type)
        } else {
            cardFilters.types.insert(type)
        }
        objectWillChange.send()
    }
    
    func pressCardRarity(_ rarity: CardRarity) {
        if cardFilters.rarity.contains(rarity) {
            cardFilters.rarity.remove(rarity)
        } else {
            cardFilters.rarity.insert(rarity)
        }
        objectWillChange.send()
    }
    
}
