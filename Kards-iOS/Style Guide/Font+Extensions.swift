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

extension Font {
    static var uiLargeTitle: Font {
        if #available(iOS 14, *) {
          return Font.custom("Oswald-Bold", size: 34.0, relativeTo: .largeTitle)
        } else {
          return Font.custom("Oswald-Bold", size: UIFontMetrics.default.scaledValue(for: 34.0))
        }
    }
    static var uiHeadline: Font {
      if #available(iOS 14, *) {
        return Font.custom("Oswald-Bold", size: 18.0, relativeTo: .title)
      } else {
        return Font.custom("Oswald-Bold", size: 18.0)
      }
    }
    static var uiTitle1: Font {
      if #available(iOS 14, *) {
        return Font.custom("Oswald-Bold", size: 28.0, relativeTo: .title)
      } else {
        return Font.custom("Oswald-Bold", size: 28.0)
      }
    }
    static var uiTitle2: Font {
      if #available(iOS 14, *) {
        return Font.custom("Oswald-Bold", size: 23.0, relativeTo: .title2)
      } else {
        return Font.custom("Oswald-Bold", size: 23.0)
      }
    }
    static var uiTitle3: Font {
      if #available(iOS 14, *) {
        return Font.custom("Oswald-Bold", size: 20.0, relativeTo: .title3)
      } else {
        return Font.custom("Oswald-Bold", size: 20.0)
      }
    }
    static var uiTitle4: Font {
      if #available(iOS 14, *) {
        return Font.custom("Oswald-Bold", size: 18.0, relativeTo: .title3)
      } else {
        return Font.custom("Oswald-Bold", size: 18.0)
      }
    }
    static var uiTitle5: Font {
      if #available(iOS 14, *) {
        return Font.custom("Oswald-Bold", size: 16.0, relativeTo: .title3)
      } else {
        return Font.custom("Oswald-Bold", size: 16.0)
      }
    }
    static var uiBody: Font {
        if #available(iOS 14, *) {
            return Font.custom("Oswald-Regular", size: 15.0, relativeTo: .body)
        } else {
          return Font.custom("Oswald-Regular", size: 15.0)
        }
    }
    static var uiButtonLabel: Font {
        if #available(iOS 14, *) {
          return Font.custom("Oswald-Regular", size: 16.0, relativeTo: .body)
        } else {
          return Font.custom("Oswald-Regular", size: 16.0)
        }
    }
    static var uiCaption: Font {
        if #available(iOS 14, *) {
          return Font.custom("Oswald-Light", size: 14.0, relativeTo: .caption)
        } else {
          return Font.custom("Oswald-Light", size: 14.0)
        }
    }
    static var uiLabel: Font {
        if #available(iOS 14, *) {
          return Font.custom("Oswald-Regular", size: 16.0, relativeTo: .body)
        } else {
          return Font.custom("Oswald-Regular", size: 16.0)
        }
    }
}
