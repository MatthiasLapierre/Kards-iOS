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

enum Nation: Int {
    case SovietUnion = 1
    case UnitedState = 2
    case Japan = 3
    case Germany = 4
    case Britain = 5
    case France = 6
    case Italy = 7
    
    var backgroundColor: Color {
        switch self {
        case .SovietUnion:
            return Color(#colorLiteral(red: 0.3098039216, green: 0.2196078431, blue: 0.1490196078, alpha: 1))
        case .UnitedState:
            return Color(#colorLiteral(red: 0.262745098, green: 0.2941176471, blue: 0.1960784314, alpha: 1))
        case .Japan:
            return Color(#colorLiteral(red: 0.5647058824, green: 0.4470588235, blue: 0.2352941176, alpha: 1))
        case .Germany:
            return Color(#colorLiteral(red: 0.3529411765, green: 0.3725490196, blue: 0.3333333333, alpha: 1))
        case .Britain:
            return Color(#colorLiteral(red: 0.5215686275, green: 0.4784313725, blue: 0.3764705882, alpha: 1))
        case .France:
            return Color(#colorLiteral(red: 0.1568627451, green: 0.2039215686, blue: 0.3294117647, alpha: 1))
        case .Italy:
            return Color(#colorLiteral(red: 0.3333333333, green: 0.3215686275, blue: 0.2823529412, alpha: 1))
        }
    }
    
    var image: Image {
        switch self {
        case .SovietUnion:
            return Image.soviet
        case .UnitedState:
            return Image.usa
        case .Japan:
            return Image.japan
        case .Germany:
            return Image.germany
        case .Britain:
            return Image.britain
        case .France:
            return Image.france
        case .Italy:
            return Image.italy
        }
    }
}
