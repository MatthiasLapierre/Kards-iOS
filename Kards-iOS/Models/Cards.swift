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
//   let welcome = try? newJSONDecoder().decode(CardsRoot.self, from: jsonData)

import Foundation

// MARK: - CardsWelcome
struct CardsRoot: Codable {
    let data: CardsData
}

// MARK: - CardsData
struct CardsData: Codable {
    let cards: Cards
}

// MARK: - Cards
struct Cards: Codable {
    let pageInfo: CardsPageInfo
    let edges: [CardsEdge]
}

// MARK: - CardsEdge
struct CardsEdge: Codable {
    let node: CardsNode
}

// MARK: - CardsNode
struct CardsNode: Codable {
    let id: Int
    let cardID, importID, image: String
    let resources: Int
    let nation: CardsNation
    let nodeJSON: CardsJSON

    enum CodingKeys: String, CodingKey {
        case id
        case cardID = "cardId"
        case importID = "importId"
        case image, resources, nation
        case nodeJSON = "json"
    }
}

// MARK: - CardsNation
struct CardsNation: Codable {
    let name: CardsName
}

enum CardsName: String, Codable {
    case japan = "Japan"
    case unitedStates = "United States"
}

// MARK: - CardsJSON
struct CardsJSON: Codable {
    let id: String
    let jsonSet: CardsSet
    let text: CardsText
    let type, image: String
    let title: CardsText
    let attack: Int?
    let rarity: CardsRarity
    let defense: Int?
    let faction: CardsFaction
    let kredits: Int
    let importID: String
    let operationCost: Int?
    let attributes, canCreate: [String]?

    enum CodingKeys: String, CodingKey {
        case id
        case jsonSet = "set"
        case text, type, image, title, attack, rarity, defense, faction, kredits
        case importID = "import_id"
        case operationCost, attributes
        case canCreate = "can_create"
    }
}

enum CardsFaction: String, Codable {
    case japan = "Japan"
    case usa = "USA"
}

enum CardsSet: String, Codable {
    case allegiance = "Allegiance"
    case base = "Base"
    case theatersOfWar = "TheatersOfWar"
}

enum CardsRarity: String, Codable {
    case elite = "Elite"
    case limited = "Limited"
    case special = "Special"
    case standard = "Standard"
}

// MARK: - CardsText
struct CardsText: Codable {
    let de, en, es, fr: String?
    let it, pl, pt, ru: String?
    let zh: String?
}

// MARK: - CardsPageInfo
struct CardsPageInfo: Codable {
    let count: Int
    let hasNextPage: Bool
}
