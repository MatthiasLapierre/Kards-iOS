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
    static let home = "Home"
    static let cardsCollection = "Cards"
    static let newsList = "News"
    static let loading = "Loading…"
    static let learnMore = "Lear more"
    static let loadMore = "Load more"
    static let reload = "Reload"
    
    //MARK: Home module
    static let homeTitle = "THE WORLD WAR II CARD GAME"
    static let ccgTitle = "THE MODERN CCG MEETS CLASSIC WARGAMING"
    static let ccgText = "KARDS combines traditional CCG gameplay with innovative mechanics inspired by classic strategy games and real battlefield tactics. Take command and challenge other players in grand-scale warfare on the ground, air, or seas."
    static let howToPlayTitle = "HOW TO PLAY?"
    static let howToPlayText = "Ready to jump into the fray and start playing? The best way is to download KARDS and start playing! If you still need additional support after the in-game tutorial, the pages here will give you further insights and help you with anything you might have missed."
    
    // MARK: Empty views
    static let noCardsTitle = "We couldn't find anything"
    static let noCardsMessage = "Try removing some filters."
    static let tryAgainTitle = "Something went wrong."
    static let tryAgainMessage = "Please, try again."
}
