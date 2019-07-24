//
//  Commit.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 23/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class Commit: Codable {
    
    // MARK: - Fields
    
    var user: Owner!
    var version: String!
    var committedAt: String!
    var status: Status!
    var url: String!
    
    
    // MARK: - Encodable
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CommitCodingKey.self)
        try container.encode(user, forKey: .user)
        try container.encode(version, forKey: .version)
        try container.encode(committedAt, forKey: .committedAt)
        try container.encode(status, forKey: .status)
        try container.encode(url, forKey: .url)
    }
    
    
    // MARK: - Decodable
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CommitCodingKey.self)
        user = try container.decode(Owner?.self, forKey: .user)
        version = try container.decode(String?.self, forKey: .version)
        committedAt = try container.decode(String?.self, forKey: .committedAt)
        status = try container.decode(Status?.self, forKey: .status)
        url = try container.decode(String?.self, forKey: .url)
    }
    
    
    // MARK: - CodingKeys Enum
    
    private enum CommitCodingKey: String, CodingKey {
        case user = "user"
        case version
        case committedAt = "committed_at"
        case status = "change_status"
        case url
    }
}
