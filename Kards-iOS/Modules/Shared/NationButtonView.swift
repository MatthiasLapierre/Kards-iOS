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

struct NationButtonView: View {
    
    private let nation: Nation
    private let callback: () -> Void
    
    init(_ nation: Nation, callback: @escaping () -> Void) {
        self.nation = nation
        self.callback = callback
    }
    
    var body: some View {
        Button(action: callback, label: {
            HStack(spacing: 10) {
                nation.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text(nation.label)
                    .font(.uiButtonLabel)
                    .lineLimit(1)
                Spacer()
            }
        })
        .buttonStyle(NationButtonStyle(backgroundColor: nation.backgroundColor))
    }
}

fileprivate struct NationButtonStyle: ButtonStyle {
    let backgroundColor: Color
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.titleText)
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .background(
                Rectangle()
                    .fill(backgroundColor)
                    .border(Color.white, width: 2)
                    .overlay(
                        Rectangle()
                            .fill(configuration.isPressed ?
                                Color.init(.sRGB, red: 1.0, green: 1.0, blue: 1.0, opacity: 0.2) :
                                Color.clear
                            )
                    )
            )
    }
}

struct NationButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NationButtonView(.France) {}
    }
}
