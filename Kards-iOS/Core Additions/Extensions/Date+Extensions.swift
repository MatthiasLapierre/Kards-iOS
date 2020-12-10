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

extension Date {
    func timeAgo(numericDates: Bool) -> String {
        let calendar = Calendar.current
        let now = Date()
        let earliest = self < now ? self : now
        let latest =  self > now ? self : now

        let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfMonth, .month, .year, .second]
        let components: DateComponents = calendar.dateComponents(unitFlags, from: earliest, to: latest)

        let year = components.year ?? 0
        let month = components.month ?? 0
        let weekOfMonth = components.weekOfMonth ?? 0
        let day = components.day ?? 0
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        let second = components.second ?? 0

        switch (year, month, weekOfMonth, day, hour, minute, second) {
            case (let year, _, _, _, _, _, _) where year >= 2: return "\(year) years ago"
            case (let year, _, _, _, _, _, _) where year == 1 && numericDates: return "1 year ago"
            case (let year, _, _, _, _, _, _) where year == 1 && !numericDates: return "Last year"
            case (_, let month, _, _, _, _, _) where month >= 2: return "\(month) months ago"
            case (_, let month, _, _, _, _, _) where month == 1 && numericDates: return "1 month ago"
            case (_, let month, _, _, _, _, _) where month == 1 && !numericDates: return "Last month"
            case (_, _, let weekOfMonth, _, _, _, _) where weekOfMonth >= 2: return "\(weekOfMonth) weeks ago"
            case (_, _, let weekOfMonth, _, _, _, _) where weekOfMonth == 1 && numericDates: return "1 week ago"
            case (_, _, let weekOfMonth, _, _, _, _) where weekOfMonth == 1 && !numericDates: return "Last week"
            case (_, _, _, let day, _, _, _) where day >= 2: return "\(day) days ago"
            case (_, _, _, let day, _, _, _) where day == 1 && numericDates: return "1 day ago"
            case (_, _, _, let day, _, _, _) where day == 1 && !numericDates: return "Yesterday"
            case (_, _, _, _, let hour, _, _) where hour >= 2: return "\(hour) hours ago"
            case (_, _, _, _, let hour, _, _) where hour == 1 && numericDates: return "1 hour ago"
            case (_, _, _, _, let hour, _, _) where hour == 1 && !numericDates: return "An hour ago"
            case (_, _, _, _, _, let minute, _) where minute >= 2: return "\(minute) minutes ago"
            case (_, _, _, _, _, let minute, _) where minute == 1 && numericDates: return "1 minute ago"
            case (_, _, _, _, _, let minute, _) where minute == 1 && !numericDates: return "A minute ago"
            case (_, _, _, _, _, _, let second) where second >= 3: return "\(second) seconds ago"
            default: return "Just now"
        }
    }
}
