//
//  Gist.swift
//  Github-Gists
//
//  Created by ApplePie on 20.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class Gist: Codable {
    
    // MARK: - Fields
    
    var comments: Int!
    var commentsURL: String!
    var commitsURL: String!
    var createdAt: String!
    var description: String!
    var files: [String:File]!
    var forksURL: String!
    var gitPullURL: String!
    var gitPushURL: String!
    var htmlURL: String!
    var id: String!
    var nodeID: String!
    var owner: Owner!
    var `public`: Bool!
    var truncated: Bool!
    var updatedAt: String!
    var url: String!
    var user: String!
    
    
    // MARK: - Encodable
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: GistCodingKey.self)
        try container.encode(comments, forKey: .comments)
        try container.encode(commentsURL, forKey: .commentsURL)
        try container.encode(commitsURL, forKey: .commitsURL)
        try container.encode(createdAt, forKey: .createdAt)
        try container.encode(description, forKey: .description)
        try container.encode(files, forKey: .files)
        try container.encode(forksURL, forKey: .forksURL)
        try container.encode(gitPullURL, forKey: .gitPullURL)
        try container.encode(gitPushURL, forKey: .gitPushURL)
        try container.encode(htmlURL, forKey: .htmlURL)
        try container.encode(id, forKey: .id)
        try container.encode(nodeID, forKey: .nodeID)
        try container.encode(owner, forKey: .owner)
        try container.encode(`public`, forKey: .public)
        try container.encode(truncated, forKey: .truncated)
        try container.encode(updatedAt, forKey: .updatedAt)
        try container.encode(url, forKey: .url)
        try container.encode(user, forKey: .user)
    }
    
    
    // MARK: - Decodable
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: GistCodingKey.self)
        comments = try container.decode(Int?.self, forKey: .comments)
        commentsURL = try container.decode(String?.self, forKey: .commentsURL)
        commitsURL = try container.decode(String?.self, forKey: .commitsURL)
        createdAt = try container.decode(String?.self, forKey: .createdAt)
        description = try container.decode(String?.self, forKey: .description)
        files = try container.decode([String: File]?.self, forKey: .files)
        forksURL = try container.decode(String?.self, forKey: .forksURL)
        gitPullURL = try container.decode(String?.self, forKey: .gitPullURL)
        gitPushURL = try container.decode(String?.self, forKey: .gitPushURL)
        htmlURL = try container.decode(String?.self, forKey: .htmlURL)
        id = try container.decode(String?.self, forKey: .id)
        nodeID = try container.decode(String?.self, forKey: .nodeID)
        owner = try container.decode(Owner?.self, forKey: .owner)
        `public` = try container.decode(Bool?.self, forKey: .public)
        truncated = try container.decode(Bool?.self, forKey: .truncated)
        updatedAt = try container.decode(String?.self, forKey: .updatedAt)
        url = try container.decode(String?.self, forKey: .url)
        user = try container.decode(String?.self, forKey: .user)
    }
    
    
    // MARK: - CodingKeys Enum
    
    private enum GistCodingKey: String, CodingKey {
        case comments
        case commentsURL = "comments_url"
        case commitsURL = "commits_url"
        case createdAt = "created_at"
        case description
        case files
        case forksURL = "forks_url"
        case gitPullURL = "git_pull_url"
        case gitPushURL = "git_push_url"
        case htmlURL = "html_url"
        case id
        case nodeID = "node_id"
        case owner
        case `public`
        case truncated
        case updatedAt = "updated_at"
        case url
        case user
    }
}
