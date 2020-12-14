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

protocol CardDisplayable  {
    var id: String { get }
    var subTitle: String { get }
    var title: String { get }
    var text: String { get }
    var imageUrl: String { get }
    var features: [Feature] { get }
}

struct Feature {
    var title: String
    var value: String
}

/// Sample card to use in previews.
class PreviewCard: CardDisplayable {
    var id: String = "ID"
    var subTitle: String = "Soviet Union"
    var title: String = "The hammer"
    var imageUrl: String = "images/card/v8/en/the_hammer.png"
    var text: String = "Deal 6 damage to a ground unit."
    var features: [Feature] = [
        Feature(title: "Nation", value: "Soviet Union"),
        Feature(title: "Rarity", value: "Limited"),
        Feature(title: "Type", value: "Order"),
        Feature(title: "Kredits", value: "3"),
        Feature(title: "Set", value: "Base")
    ]
}
