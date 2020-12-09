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

struct HomeView: View {
    var body: some View {
        contentView
            .navigationBarTitle(
                Text(String.home),
                displayMode: .inline
            )
            .navigationBarHidden(true)
    }
    
    private var contentView: some View {
        ScrollView {
            VStack(spacing: 50) {
                HeaderView()
                ccgView
                howToPlayView
            }
            .background(BackgroundView())
        }
        .background(Color.backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    private var ccgView: some View {
        VStack {
            CardStack()
            CardView(title: String.ccgTitle, text: String.ccgText)
        }
    }
    
    private var howToPlayView: some View {
        VStack {
            Image.deck
                .resizable()
                .frame(width: 320, height: 200, alignment: .center)
            CardView(title: String.howToPlayTitle, text: String.howToPlayText)
        }
    }
}

fileprivate struct HeaderView: View {
    
    private struct SizeKey: PreferenceKey {
      static func reduce(value: inout CGSize?, nextValue: () -> CGSize?) {
        value = value ?? nextValue()
      }
    }
   
    @State private var height: CGFloat?
    
    var body: some View {
        return HStack {
            GeometryReader { proxy in
                ZStack {
                    Image.banner
                        .resizable()
                        .scaledToFill()
                        .frame(width: proxy.size.width)
                    VStack {
                        Image.logo
                            .resizable()
                            .scaledToFit()
                            .frame(width: proxy.size.width * 0.4, height: proxy.size.width * 0.4)
                        Text(String.homeTitle)
                            .font(Font.uiHeadline)
                            .foregroundColor(Color.titleText)
                    }
                    .padding(.vertical, 50)
                }
                .background(GeometryReader { proxy in
                    Color.clear.preference(key: SizeKey.self, value: proxy.size)
                })
                .frame(width: proxy.size.width)
                .onPreferenceChange(SizeKey.self) { size in
                    height = size?.height
                }
            }
            .frame(height: height)
        }
    }
    
}

fileprivate struct CardStack: View {
    
    private struct SizeKey: PreferenceKey {
      static func reduce(value: inout CGSize?, nextValue: () -> CGSize?) {
        value = value ?? nextValue()
      }
    }
   
    @State private var height: CGFloat?
    
    var body: some View {
        return HStack {
            GeometryReader { proxy in
                let cardWidth = proxy.size.width * 0.4
                let transformX = proxy.size.width * 0.08
                let transformY = proxy.size.width * 0.15
                ZStack {
                    Image.card1
                        .resizable()
                        .scaledToFill()
                        .frame(width: cardWidth)
                        .rotationEffect(.init(degrees: -25))
                        .transformEffect(.init(translationX: CGFloat(-transformY), y: CGFloat(transformX)))
                    Image.card2
                        .resizable()
                        .scaledToFill()
                        .frame(width: cardWidth)
                    
                    Image.card3
                        .resizable()
                        .scaledToFill()
                        .frame(width: cardWidth)
                        .rotationEffect(.init(degrees: 25))
                        .transformEffect(.init(translationX: CGFloat(transformY), y: CGFloat(transformX)))
                }
                .background(GeometryReader { proxy in
                    Color.clear.preference(key: SizeKey.self, value: proxy.size)
                })
                .frame(width: proxy.size.width)
                .onPreferenceChange(SizeKey.self) { size in
                    height = size?.height
                }
            }
            .frame(height: height)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11")
    }
}
