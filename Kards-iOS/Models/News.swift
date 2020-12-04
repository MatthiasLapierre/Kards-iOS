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

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(NewsRoot.self, from: jsonData)

import Foundation

// MARK: - NewsWelcome
struct NewsRoot: Codable {
    let page, resultsPerPage, resultsSize, totalResultsSize: Int
    let totalPages: Int
    let nextPage, prevPage: String
    let results: [NewsResult]
    let version, license: String

    enum CodingKeys: String, CodingKey {
        case page
        case resultsPerPage = "results_per_page"
        case resultsSize = "results_size"
        case totalResultsSize = "total_results_size"
        case totalPages = "total_pages"
        case nextPage = "next_page"
        case prevPage = "prev_page"
        case results, version, license
    }
}

// MARK: - NewsResult
struct NewsResult: Codable {
    let id, uid: String
    let type: NewsAlternateLanguageType
    let href: String
    let tags: [String]
    let firstPublicationDate, lastPublicationDate: Date
    let slugs: [String]
    let linkedDocuments: [JSONAny]
    let lang: String
    let alternateLanguages: [NewsAlternateLanguage]
    let data: NewsData

    enum CodingKeys: String, CodingKey {
        case id, uid, type, href, tags
        case firstPublicationDate = "first_publication_date"
        case lastPublicationDate = "last_publication_date"
        case slugs
        case linkedDocuments = "linked_documents"
        case lang
        case alternateLanguages = "alternate_languages"
        case data
    }
}

// MARK: - NewsAlternateLanguage
struct NewsAlternateLanguage: Codable {
    let id, uid: String
    let type: NewsAlternateLanguageType
    let lang: String
}

enum NewsAlternateLanguageType: String, Codable {
    case article = "article"
}

// MARK: - NewsData
struct NewsData: Codable {
    let title: [NewsSummary]
    let date: String
    let image: NewsImage
    let summary: [NewsSummary]
    let showimage: String
    let body: [NewsBody]
}

// MARK: - NewsBody
struct NewsBody: Codable {
    let sliceType: NewsSliceType
    let sliceLabel: JSONNull?
    let items: [NewsItem]
    let primary: NewsPrimary

    enum CodingKeys: String, CodingKey {
        case sliceType = "slice_type"
        case sliceLabel = "slice_label"
        case items, primary
    }
}

// MARK: - NewsItem
struct NewsItem: Codable {
    let itemLabel: [NewsSummary]?
    let itemLink: NewsItemLink?

    enum CodingKeys: String, CodingKey {
        case itemLabel = "item_label"
        case itemLink = "item_link"
    }
}

// MARK: - NewsSummary
struct NewsSummary: Codable {
    let type, text: String
    let spans: [JSONAny]
}

// MARK: - NewsItemLink
struct NewsItemLink: Codable {
    let linkType: NewsLinkType
    let url: String
    let target: NewsTarget?

    enum CodingKeys: String, CodingKey {
        case linkType = "link_type"
        case url, target
    }
}

enum NewsLinkType: String, Codable {
    case web = "Web"
}

enum NewsTarget: String, Codable {
    case blank = "_blank"
}

// MARK: - NewsPrimary
struct NewsPrimary: Codable {
    let sliceText: [NewsSliceText]?
    let sliceTitle: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case sliceText = "slice_text"
        case sliceTitle = "slice_title"
    }
}

// MARK: - NewsSliceText
struct NewsSliceText: Codable {
    let type: NewsSliceTextType
    let text: String?
    let spans: [NewsSpan]?
    let url: String?
    let alt, copyright: JSONNull?
    let dimensions: NewsDimensions?
    let oembed: NewsOembed?
}

// MARK: - NewsDimensions
struct NewsDimensions: Codable {
    let width, height: Int
}

// MARK: - NewsOembed
struct NewsOembed: Codable {
    let type: String
    let embedURL: String
    let title, providerName: String
    let thumbnailURL: String
    let url: String
    let version: String
    let authorName, authorURL, providerURL, cacheAge: JSONNull?
    let thumbnailWidth, thumbnailHeight: JSONNull?
    let html: String

    enum CodingKeys: String, CodingKey {
        case type
        case embedURL = "embed_url"
        case title
        case providerName = "provider_name"
        case thumbnailURL = "thumbnail_url"
        case url, version
        case authorName = "author_name"
        case authorURL = "author_url"
        case providerURL = "provider_url"
        case cacheAge = "cache_age"
        case thumbnailWidth = "thumbnail_width"
        case thumbnailHeight = "thumbnail_height"
        case html
    }
}

// MARK: - NewsSpan
struct NewsSpan: Codable {
    let start, end: Int
    let type: NewsSpanType
    let data: NewsItemLink?
}

enum NewsSpanType: String, Codable {
    case hyperlink = "hyperlink"
    case strong = "strong"
}

enum NewsSliceTextType: String, Codable {
    case embed = "embed"
    case heading2 = "heading2"
    case heading3 = "heading3"
    case heading4 = "heading4"
    case image = "image"
    case listItem = "list-item"
    case oListItem = "o-list-item"
    case paragraph = "paragraph"
}

enum NewsSliceType: String, Codable {
    case buttons = "buttons"
    case text = "text"
}

// MARK: - NewsImage
class NewsImage: Codable {
    let dimensions: NewsDimensions
    let alt, copyright: JSONNull?
    let url: String
    let hero: NewsImage?

    init(dimensions: NewsDimensions, alt: JSONNull?, copyright: JSONNull?, url: String, hero: NewsImage?) {
        self.dimensions = dimensions
        self.alt = alt
        self.copyright = copyright
        self.url = url
        self.hero = hero
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
