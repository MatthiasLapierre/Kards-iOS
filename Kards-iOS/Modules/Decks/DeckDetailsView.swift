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

struct DeckDetailsView: View {
    
    private let deckDisplayable: DeckDisplayable
    
    init(deck: DeckDisplayable) {
        self.deckDisplayable = deck
    }
    
    var body: some View {
        contentView
    }
    
    private var contentView: some View {
        ScrollView {
            VStack {
                headerView
                detailsView
            }
        }
    }
    
    private var headerView: some View {
        VStack {
            Text(String.deck.uppercased())
                .multilineTextAlignment(.center)
                .font(.uiTitle3)
                .foregroundColor(.titleText)
            Text(deckDisplayable.name.uppercased())
                .multilineTextAlignment(.center)
                .font(.uiLargeTitle)
                .foregroundColor(.titleText)
        }
    }
    
    private var detailsView: some View {
        HStack(alignment: .top) {
            informationView
            Spacer()
            scoreView
        }
        .padding(.horizontal, 20)
        .padding(.top, 40)
    }
    
    private var informationView: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(0..<deckDisplayable.information.count) {
                let information = deckDisplayable.information[$0]
                informationItemView(title: information.title, text: information.text)
            }
        }
    }
    
    private var scoreView: some View {
        Text(deckDisplayable.score)
            .font(.uiLargeTitle)
            .foregroundColor(deckDisplayable.score.starts(with: "+") ?
                                Color.green : Color.red)
    }
    
    private func informationItemView(title: String, text: String) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.uiTitle5)
                .foregroundColor(.bodyText)
            Text(text)
                .font(.uiBody)
                .foregroundColor(.bodyText)
        }
    }
}

struct DeckDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DeckDetailsView(deck: PreviewDeck())
    }
}
