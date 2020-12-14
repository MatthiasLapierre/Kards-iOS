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

struct DeckItemView: View {
    
    private let deckDisplayable: DeckDisplayable
    
    init(deck: DeckDisplayable) {
        self.deckDisplayable = deck
    }
    
    var body: some View {
        contentView
    }
    
    @ViewBuilder var contentView: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            largeContentView
        } else {
            normalContentView
        }
    }
    
    private var normalContentView: some View {
        HStack {
            imageView
            VStack(alignment: .leading) {
                titleView
                HStack {
                    mainNationView
                    nationSeparatorView
                    secondNationView
                }
                authorView
                    .padding(.top, 5)
            }
            Spacer()
            scoreView
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(
            backgroundView
        )
    }
    
    private var largeContentView: some View {
        HStack {
            imageView
            VStack(alignment: .leading) {
                titleView
                authorView
            }
            Spacer()
            VStack(alignment: .leading) {
                mainNationView
                secondNationView
            }
            .frame(width: 200, alignment: .leading)
            scoreView
                .frame(width: 50, alignment: .center)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(backgroundView)
    }
    
    private var imageView: some View {
        deckDisplayable.image
            .resizable()
            .frame(width: 50, height: 50)
            .scaledToFit()
    }
    
    private var titleView: some View {
        Text(deckDisplayable.name.uppercased())
            .lineLimit(1)
            .font(.uiTitle3)
            .foregroundColor(.titleText)
    }
    
    private var authorView: some View {
        HStack {
            Text(deckDisplayable.username)
                .font(.uiCaption)
                .foregroundColor(.accent)
            Text(deckDisplayable.updatedAt)
                .font(.uiCaption)
                .foregroundColor(.bodyText)
        }
    }
    
    private var mainNationView: some View {
        Text("\(deckDisplayable.mainNation.uppercased()) (\(deckDisplayable.mainNationCards))")
            .font(.uiLabel)
            .foregroundColor(.bodyText)
    }
    
    private var nationSeparatorView: some View {
        Text("/")
            .font(.uiLabel)
            .foregroundColor(.bodyText)
            .padding(.horizontal, 8)
    }
    
    private var secondNationView: some View {
        Text("\(deckDisplayable.secondNation.uppercased()) (\(deckDisplayable.secondNationCards))")
            .font(.uiLabel)
            .foregroundColor(.bodyText)
    }
    
    private var scoreView: some View {
        Text("\(deckDisplayable.score)")
            .font(.uiTitle5)
            .foregroundColor(deckDisplayable.score.starts(with: "+") ?
                                Color.green : Color.red)
    }
    
    private var backgroundView: some View {
        deckDisplayable.backgroundColor
            .overlay(Image.deckOverlayBackground)
            .clipped()
    }
}

struct DeckItemView_Previews: PreviewProvider {
    static var previews: some View {
        DeckItemView(deck: PreviewDeck())
            .previewLayout(.sizeThatFits)
    }
}
