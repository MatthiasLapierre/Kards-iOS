// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

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
              GraphQLField("json", type: .nonNull(.scalar(JSONObject.self))),
              GraphQLField("image", alias: "imageUrl", arguments: ["language": GraphQLVariable("language")], type: .nonNull(.scalar(String.self))),
              GraphQLField("image", alias: "thumbUrl", arguments: ["type": "thumb", "language": GraphQLVariable("language")], type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: Int, cardId: String, importId: String? = nil, json: JSONObject, imageUrl: String, thumbUrl: String) {
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

          public var json: JSONObject {
            get {
              return resultMap["json"]! as! JSONObject
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
