// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum DeckSortType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case week
  case month
  case updated
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "week": self = .week
      case "month": self = .month
      case "updated": self = .updated
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .week: return "week"
      case .month: return "month"
      case .updated: return "updated"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DeckSortType, rhs: DeckSortType) -> Bool {
    switch (lhs, rhs) {
      case (.week, .week): return true
      case (.month, .month): return true
      case (.updated, .updated): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DeckSortType] {
    return [
      .week,
      .month,
      .updated,
    ]
  }
}

public enum DeckOrderType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case desc
  case asc
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "desc": self = .desc
      case "asc": self = .asc
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .desc: return "desc"
      case .asc: return "asc"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DeckOrderType, rhs: DeckOrderType) -> Bool {
    switch (lhs, rhs) {
      case (.desc, .desc): return true
      case (.asc, .asc): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DeckOrderType] {
    return [
      .desc,
      .asc,
    ]
  }
}

public struct Range: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - min
  ///   - max
  public init(min: Swift.Optional<Int?> = nil, max: Swift.Optional<Int?> = nil) {
    graphQLMap = ["min": min, "max": max]
  }

  public var min: Swift.Optional<Int?> {
    get {
      return graphQLMap["min"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "min")
    }
  }

  public var max: Swift.Optional<Int?> {
    get {
      return graphQLMap["max"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "max")
    }
  }
}

public final class GetCardsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getCards($language: String, $offset: Int, $nationIds: [Int], $kredits: [Int], $q: String, $type: [String], $rarity: [String], $set: [String], $showSpawnables: Boolean) {
      cards(
        language: $language
        first: 20
        offset: $offset
        nationIds: $nationIds
        kredits: $kredits
        q: $q
        type: $type
        set: $set
        rarity: $rarity
        showSpawnables: $showSpawnables
      ) {
        __typename
        pageInfo {
          __typename
          count
          hasNextPage
        }
        edges {
          __typename
          node {
            __typename
            id
            cardId
            importId
            json
            imageUrl: image(language: $language)
            thumbUrl: image(type: thumb, language: $language)
          }
        }
      }
    }
    """

  public let operationName: String = "getCards"

  public let operationIdentifier: String? = "8171902bd0093e7cf2d6a417dbcae35ff1ad0b1a1debbba7fefd292466a9390c"

  public var language: String?
  public var offset: Int?
  public var nationIds: [Int?]?
  public var kredits: [Int?]?
  public var q: String?
  public var type: [String?]?
  public var rarity: [String?]?
  public var `set`: [String?]?
  public var showSpawnables: Bool?

  public init(language: String? = nil, offset: Int? = nil, nationIds: [Int?]? = nil, kredits: [Int?]? = nil, q: String? = nil, type: [String?]? = nil, rarity: [String?]? = nil, `set`: [String?]? = nil, showSpawnables: Bool? = nil) {
    self.language = language
    self.offset = offset
    self.nationIds = nationIds
    self.kredits = kredits
    self.q = q
    self.type = type
    self.rarity = rarity
    self.`set` = `set`
    self.showSpawnables = showSpawnables
  }

  public var variables: GraphQLMap? {
    return ["language": language, "offset": offset, "nationIds": nationIds, "kredits": kredits, "q": q, "type": type, "rarity": rarity, "set": `set`, "showSpawnables": showSpawnables]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("cards", arguments: ["language": GraphQLVariable("language"), "first": 20, "offset": GraphQLVariable("offset"), "nationIds": GraphQLVariable("nationIds"), "kredits": GraphQLVariable("kredits"), "q": GraphQLVariable("q"), "type": GraphQLVariable("type"), "set": GraphQLVariable("set"), "rarity": GraphQLVariable("rarity"), "showSpawnables": GraphQLVariable("showSpawnables")], type: .nonNull(.object(Card.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(cards: Card) {
      self.init(unsafeResultMap: ["__typename": "Query", "cards": cards.resultMap])
    }

    public var cards: Card {
      get {
        return Card(unsafeResultMap: resultMap["cards"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "cards")
      }
    }

    public struct Card: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CardConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pageInfo: PageInfo, edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CardConnection", "pageInfo": pageInfo.resultMap, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int, hasNextPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "count": count, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }

        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CardNode"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "CardNode", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Card"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("cardId", type: .nonNull(.scalar(String.self))),
              GraphQLField("importId", type: .scalar(String.self)),
              GraphQLField("json", type: .nonNull(.scalar(String.self))),
              GraphQLField("image", alias: "imageUrl", arguments: ["language": GraphQLVariable("language")], type: .nonNull(.scalar(String.self))),
              GraphQLField("image", alias: "thumbUrl", arguments: ["type": "thumb", "language": GraphQLVariable("language")], type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, cardId: String, importId: String? = nil, json: String, imageUrl: String, thumbUrl: String) {
            self.init(unsafeResultMap: ["__typename": "Card", "id": id, "cardId": cardId, "importId": importId, "json": json, "imageUrl": imageUrl, "thumbUrl": thumbUrl])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var cardId: String {
            get {
              return resultMap["cardId"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "cardId")
            }
          }

          public var importId: String? {
            get {
              return resultMap["importId"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "importId")
            }
          }

          public var json: String {
            get {
              return resultMap["json"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "json")
            }
          }

          public var imageUrl: String {
            get {
              return resultMap["imageUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "imageUrl")
            }
          }

          public var thumbUrl: String {
            get {
              return resultMap["thumbUrl"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "thumbUrl")
            }
          }
        }
      }
    }
  }
}

public final class GetDecksQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getDecks($language: String, $offset: Int, $main: [Int], $ally: [Int], $version: Int, $q: String, $includes: [String], $exclude: [String], $sortBy: DeckSortType, $order: DeckOrderType, $resources: Range) {
      decks(
        language: $language
        first: 20
        offset: $offset
        main: $main
        ally: $ally
        version: $version
        q: $q
        includes: $includes
        exclude: $exclude
        sortBy: $sortBy
        order: $order
        resources: $resources
      ) {
        __typename
        edges {
          __typename
          node {
            __typename
            id
            updatedAt
            slug
            name
            views
            resources
            mainNation {
              __typename
              id
              name
            }
            allyNation {
              __typename
              id
              name
            }
            score {
              __typename
              score
            }
            stats {
              __typename
              key
              value
            }
            user {
              __typename
              id
              username
            }
          }
        }
        pageInfo {
          __typename
          count
          hasNextPage
        }
      }
    }
    """

  public let operationName: String = "getDecks"

  public let operationIdentifier: String? = "6a5518a6e16ae871bda78d0ea531a73113e4a1b81585d056d8c1617a818b820e"

  public var language: String?
  public var offset: Int?
  public var main: [Int?]?
  public var ally: [Int?]?
  public var version: Int?
  public var q: String?
  public var includes: [String?]?
  public var exclude: [String?]?
  public var sortBy: DeckSortType?
  public var order: DeckOrderType?
  public var resources: Range?

  public init(language: String? = nil, offset: Int? = nil, main: [Int?]? = nil, ally: [Int?]? = nil, version: Int? = nil, q: String? = nil, includes: [String?]? = nil, exclude: [String?]? = nil, sortBy: DeckSortType? = nil, order: DeckOrderType? = nil, resources: Range? = nil) {
    self.language = language
    self.offset = offset
    self.main = main
    self.ally = ally
    self.version = version
    self.q = q
    self.includes = includes
    self.exclude = exclude
    self.sortBy = sortBy
    self.order = order
    self.resources = resources
  }

  public var variables: GraphQLMap? {
    return ["language": language, "offset": offset, "main": main, "ally": ally, "version": version, "q": q, "includes": includes, "exclude": exclude, "sortBy": sortBy, "order": order, "resources": resources]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("decks", arguments: ["language": GraphQLVariable("language"), "first": 20, "offset": GraphQLVariable("offset"), "main": GraphQLVariable("main"), "ally": GraphQLVariable("ally"), "version": GraphQLVariable("version"), "q": GraphQLVariable("q"), "includes": GraphQLVariable("includes"), "exclude": GraphQLVariable("exclude"), "sortBy": GraphQLVariable("sortBy"), "order": GraphQLVariable("order"), "resources": GraphQLVariable("resources")], type: .nonNull(.object(Deck.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(decks: Deck) {
      self.init(unsafeResultMap: ["__typename": "Query", "decks": decks.resultMap])
    }

    public var decks: Deck {
      get {
        return Deck(unsafeResultMap: resultMap["decks"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "decks")
      }
    }

    public struct Deck: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DeckConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil, pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "DeckConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DeckNode"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "DeckNode", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Deck"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(Int.self))),
              GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("slug", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("views", type: .scalar(Int.self)),
              GraphQLField("resources", type: .scalar(Int.self)),
              GraphQLField("mainNation", type: .nonNull(.object(MainNation.selections))),
              GraphQLField("allyNation", type: .nonNull(.object(AllyNation.selections))),
              GraphQLField("score", type: .nonNull(.object(Score.selections))),
              GraphQLField("stats", type: .list(.object(Stat.selections))),
              GraphQLField("user", type: .nonNull(.object(User.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, updatedAt: String, slug: String, name: String, views: Int? = nil, resources: Int? = nil, mainNation: MainNation, allyNation: AllyNation, score: Score, stats: [Stat?]? = nil, user: User) {
            self.init(unsafeResultMap: ["__typename": "Deck", "id": id, "updatedAt": updatedAt, "slug": slug, "name": name, "views": views, "resources": resources, "mainNation": mainNation.resultMap, "allyNation": allyNation.resultMap, "score": score.resultMap, "stats": stats.flatMap { (value: [Stat?]) -> [ResultMap?] in value.map { (value: Stat?) -> ResultMap? in value.flatMap { (value: Stat) -> ResultMap in value.resultMap } } }, "user": user.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: Int {
            get {
              return resultMap["id"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var updatedAt: String {
            get {
              return resultMap["updatedAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "updatedAt")
            }
          }

          public var slug: String {
            get {
              return resultMap["slug"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "slug")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var views: Int? {
            get {
              return resultMap["views"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "views")
            }
          }

          public var resources: Int? {
            get {
              return resultMap["resources"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "resources")
            }
          }

          public var mainNation: MainNation {
            get {
              return MainNation(unsafeResultMap: resultMap["mainNation"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "mainNation")
            }
          }

          public var allyNation: AllyNation {
            get {
              return AllyNation(unsafeResultMap: resultMap["allyNation"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "allyNation")
            }
          }

          public var score: Score {
            get {
              return Score(unsafeResultMap: resultMap["score"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "score")
            }
          }

          public var stats: [Stat?]? {
            get {
              return (resultMap["stats"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Stat?] in value.map { (value: ResultMap?) -> Stat? in value.flatMap { (value: ResultMap) -> Stat in Stat(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [Stat?]) -> [ResultMap?] in value.map { (value: Stat?) -> ResultMap? in value.flatMap { (value: Stat) -> ResultMap in value.resultMap } } }, forKey: "stats")
            }
          }

          public var user: User {
            get {
              return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "user")
            }
          }

          public struct MainNation: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Nation"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: String) {
              self.init(unsafeResultMap: ["__typename": "Nation", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }

          public struct AllyNation: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Nation"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, name: String) {
              self.init(unsafeResultMap: ["__typename": "Nation", "id": id, "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }

          public struct Score: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Score"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("score", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(score: Int) {
              self.init(unsafeResultMap: ["__typename": "Score", "score": score])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var score: Int {
              get {
                return resultMap["score"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "score")
              }
            }
          }

          public struct Stat: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Stats"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("key", type: .scalar(String.self)),
                GraphQLField("value", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(key: String? = nil, value: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Stats", "key": key, "value": value])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var key: String? {
              get {
                return resultMap["key"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "key")
              }
            }

            public var value: String? {
              get {
                return resultMap["value"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PublicUser"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(Int.self))),
                GraphQLField("username", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: Int, username: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "PublicUser", "id": id, "username": username])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: Int {
              get {
                return resultMap["id"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var username: String? {
              get {
                return resultMap["username"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "username")
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int, hasNextPage: Bool) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "count": count, "hasNextPage": hasNextPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }

        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }
      }
    }
  }
}
