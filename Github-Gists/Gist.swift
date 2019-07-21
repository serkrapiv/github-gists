//
//  Gist.swift
//  Github-Gists
//
//  Created by ApplePie on 20.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class Gist {
    
    var comments: Int!
    var commentsURL: String!
    var commitsURL: String!
    var createdAt: String!
    var description: String!
    var files: [File]!
    var forksURL: String!
    var gitPullURL: String!
    var gitPushURL: String!
    var htmlURL: String!
    var id: String!
    var nodeID: String!
    var owner: Owner!
    var `public`: Bool!
    var truncated: Bool!
    var updateAt: String!
    var url: String!
    var user: String!
    
}
