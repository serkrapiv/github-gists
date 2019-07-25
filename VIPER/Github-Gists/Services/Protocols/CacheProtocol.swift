//
//  CacheProtocol.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

protocol CacheServiceProtocol: class {
    
    func load(by urlString: String) -> Data?
    func save(with urlString: String, and data: Data)
    
}
