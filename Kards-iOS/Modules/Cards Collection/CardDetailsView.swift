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

struct CardDetailsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    private var cardDisplayable: CardDisplayable
    
    init(card: CardDisplayable) {
        self.cardDisplayable = card
    }
    
    var body: some View {
        ZStack {
            BackgroundView()
            contentView
        }
    }
    
    @ViewBuilder private var contentView: some View {
        if UIDevice.current.userInterfaceIdiom == .pad
            && UIDevice.current.orientation.isLandscape {
            VStack {
                HStack {
                    Spacer()
                    closeView
                }
                .padding([.top, .trailing], 8)
                HStack {
                    imageView
                    VStack {
                        subTitleView
                        titleView
                        textView
                            .padding(.bottom, 20)
                        featuresView
                    }
                }
                .padding(.all, 20)
            }
        } else {
            VStack {
                HStack {
                    Spacer()
                    closeView
                }
                .padding([.top, .trailing], 8)
                ScrollView {
                    VStack {
                        subTitleView
                        titleView
                        imageView
                            .padding(.top, 20)
                            .padding(.bottom, 30)
                        textView
                            .padding(.bottom, 20)
                        featuresView
                    }
                    .padding(.all, 20)
                }
            }
        }
    }
    
    private var closeView: some View {
        CloseView {
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    private var imageView: some View {
        CardImageView(cardDisplayable.imageUrl)
            .frame(width: 200)
    }
    
    private var titleView: some View {
        Text(cardDisplayable.title.uppercased())
            .multilineTextAlignment(.center)
            .font(.uiLargeTitle)
            .foregroundColor(.titleText)
    }
    
    private var subTitleView: some View {
        Text(cardDisplayable.subTitle.uppercased())
            .multilineTextAlignment(.center)
            .font(.uiTitle3)
            .foregroundColor(.titleText)
    }
    
    private var textView: some View {
        Text(cardDisplayable.text)
            .multilineTextAlignment(.center)
            .font(.uiTitle3)
            .foregroundColor(.bodyText)
    }
    
    private var featuresView: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(0..<cardDisplayable.features.count) {
                featureRow(feature: cardDisplayable.features[$0])
            }
        }
    }
    
    private func featureRow(feature: Feature) -> some View {
        HStack {
            Text("\(feature.title):")
                .font(.uiTitle6)
                .foregroundColor(.bodyText)
            Text(feature.value)
                .font(.uiLabel)
                .foregroundColor(.bodyText)
        }
    }
}

struct CardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CardDetailsView(card: PreviewCard())
    }
}