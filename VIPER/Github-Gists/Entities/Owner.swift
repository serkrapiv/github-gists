//
//  Owner.swift
//  Github-Gists
//
//  Created by ApplePie on 20.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class Owner: Codable, Hashable {
    
    // MARK: - Fields
    
    var avatarURL: String!
    var eventsURL: String!
    var followersURL: String!
    var followingURL: String!
    var gistsURL: String!
    var gravatarID: String!
    var htmlURL: String!
    var id: Int!
    var login: String!
    var nodeID: String!
    var organizationsURL: String!
    var receivedEventsURL: String!
    var reposURL: String!
    var siteAdmin: Bool!
    var starredURL: String!
    var subscriptionsURL: String!
    var type: String!
    var url: String!
    var avatarImage: UIImage!

    
    // MARK: - Encodable
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: OwnerCodingKey.self)
        try container.encode(avatarURL, forKey: .avatarURL)
        try container.encode(eventsURL, forKey: .eventsURL)
        try container.encode(followersURL, forKey: .followersURL)
        try container.encode(followingURL, forKey: .followingURL)
        try container.encode(gistsURL, forKey: .gistsURL)
        try container.encode(gravatarID, forKey: .gravatarID)
        try container.encode(htmlURL, forKey: .htmlURL)
        try container.encode(id, forKey: .id)
        try container.encode(login, forKey: .login)
        try container.encode(nodeID, forKey: .nodeID)
        try container.encode(organizationsURL, forKey: .organizationsURL)
        try container.encode(receivedEventsURL, forKey: .receivedEventsURL)
        try container.encode(reposURL, forKey: .reposURL)
        try container.encode(siteAdmin, forKey: .siteAdmin)
        try container.encode(starredURL, forKey: .starredURL)
        try container.encode(subscriptionsURL, forKey: .subscriptionsURL)
        try container.encode(type, forKey: .type)
        try container.encode(url, forKey: .url)
    }
    
    
    // MARK: - Decodable
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: OwnerCodingKey.self)
        avatarURL = try container.decode(String?.self, forKey: .avatarURL)
        eventsURL = try container.decode(String?.self, forKey: .eventsURL)
        followersURL = try container.decode(String?.self, forKey: .followersURL)
        followingURL = try container.decode(String?.self, forKey: .followingURL)
        gistsURL = try container.decode(String?.self, forKey: .gistsURL)
        gravatarID = try container.decode(String?.self, forKey: .gravatarID)
        htmlURL = try container.decode(String?.self, forKey: .htmlURL)
        id = try container.decode(Int?.self, forKey: .id)
        login = try container.decode(String?.self, forKey: .login)
        nodeID = try container.decode(String?.self, forKey: .nodeID)
        organizationsURL = try container.decode(String?.self, forKey: .organizationsURL)
        receivedEventsURL = try container.decode(String?.self, forKey: .receivedEventsURL)
        reposURL = try container.decode(String?.self, forKey: .reposURL)
        siteAdmin = try container.decode(Bool?.self, forKey: .siteAdmin)
        starredURL = try container.decode(String?.self, forKey: .starredURL)
        subscriptionsURL = try container.decode(String?.self, forKey: .subscriptionsURL)
        type = try container.decode(String?.self, forKey: .type)
        url = try container.decode(String?.self, forKey: .url)
    }
    
    
    // MARK: - Hashable
    
    static func == (lhs: Owner, rhs: Owner) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
    // MARK: - CodingKeys Enum
    
    private enum OwnerCodingKey: String, CodingKey {
        case avatarURL = "avatar_url"
        case eventsURL = "events_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case gravatarID = "gravatar_id"
        case htmlURL = "html_url"
        case id
        case login
        case nodeID = "node_id"
        case organizationsURL = "organizations_url"
        case receivedEventsURL = "received_events_url"
        case reposURL = "repos_url"
        case siteAdmin = "site_admin"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case type
        case url
    }
}
