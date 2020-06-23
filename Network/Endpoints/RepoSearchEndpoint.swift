//
//  RepoSearchEndpoint.swift
//  GitHub App
//
//  Created by Vlad Gordiichuk on 23.06.2020.
//  Copyright © 2020 Vlad Gordiichuk. All rights reserved.
//

struct RepoSearchRequest: Encodable {
    
    public var query = ""
    
    private let sort = "stars"
    private let order = "desc"
    
    public var page: Int = 0
    private let limit: Int = 10
    public var total: Int = -1
    
    public var offset: Int { page * limit }
    
    public var canPerformRequest: Bool {
        total == -1 || offset < total
    }
    
    public mutating func withQuery(_ query: String) -> RepoSearchRequest {
        self.query = query
        return self
    }
    
    enum CodingKeys: String, CodingKey {
        case query = "q"
        case sort, order, page
        case limit = "per_page"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(query, forKey: .query)
        try container.encode(sort, forKey: .sort)
        try container.encode(order, forKey: .order)
        try container.encode(page, forKey: .page)
        try container.encode(limit, forKey: .limit)
    }
}

struct RepoSearchResponse: Decodable {
    
    let totalCount: Int
    let items: [Repository]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        totalCount = try container.decode(Int.self, forKey: .totalCount)
        items = try container.decode([Repository].self, forKey: .items)
    }
}

extension EndpointCollection {
    
    static func getRepos() -> Endpoint {
        return Endpoint(method: .get, pathEnding: "repositories")
    }
}
