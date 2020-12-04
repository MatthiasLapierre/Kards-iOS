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
    }
    
    private var contentView: some View {
        ScrollView {
            VStack {
                headerView
                CCGView()
            }
        }
        .background(Color.backgroundColor)
        .edgesIgnoringSafeArea([.all])
    }
    
    private var headerView: some View {
        Image.logoBanner
            .resizable()
            .scaledToFit()
    }
}

fileprivate struct CCGView: View {
    private struct SizeKey: PreferenceKey {
      static func reduce(value: inout CGSize?, nextValue: () -> CGSize?) {
        value = value ?? nextValue()
      }
    }
    
    @State private var height: CGFloat?
    
    var body: some View {
        VStack {
            HStack {
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
            }
            .frame(height: height)
            VStack {
                Text(verbatim: String.ccgTitle)
                    .font(Font.uiTitle1)
                    .foregroundColor(Color.bodyText)
                Text(verbatim: String.ccgText)
                    .font(Font.uiBody)
                    .foregroundColor(Color.bodyText)
                    .padding(.top, 5)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 20)
            .background(
                Color.cardBackground
                    .overlay(Image.cardBackground
                                .resizable()
                                .opacity(0.8))
            )
            .shadow(radius: 5)
        }
        .background(
            Color.clear
                .overlay(
                    Image.overlay1Background
                        .resizable()
                        .scaledToFill()
                )
        )
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11")
    }
}
