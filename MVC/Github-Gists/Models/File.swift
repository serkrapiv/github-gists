//
//  File.swift
//  Github-Gists
//
//  Created by ApplePie on 21.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class File: Codable {
    
    // MARK: - Fields
    
    var filename: String!
    var language: String!
    var rawURL: String!
    var size: Int!
    var type: String!
    
    
    // MARK: - Encodable
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: FileCodingKey.self)
        try container.encode(filename, forKey: .filename)
        try container.encode(language, forKey: .language)
        try container.encode(rawURL, forKey: .rawURL)
        try container.encode(size, forKey: .size)
        try container.encode(type, forKey: .type)
    }
    
    
    // MARK: - Decodable
    
    required init(from decoder: Decoder) throws {
        let contrainer = try decoder.container(keyedBy: FileCodingKey.self)
        filename = try contrainer.decode(String?.self, forKey: .filename)
        language = try contrainer.decode(String?.self, forKey: .language)
        rawURL = try contrainer.decode(String?.self, forKey: .rawURL)
        size = try contrainer.decode(Int?.self, forKey: .size)
        type = try contrainer.decode(String?.self, forKey: .type)
    }
    
    
    // MARK: - CodingKeys Enum
    
    private enum FileCodingKey: String, CodingKey {
        case filename
        case language
        case rawURL = "raw_url"
        case size
        case type
    }
}
