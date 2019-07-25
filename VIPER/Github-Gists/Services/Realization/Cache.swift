//
//  Cache.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

let storage = NSCache<AnyObject, AnyObject>()

class Cache: CacheServiceProtocol {
    
    func load(by urlString: String) -> Data? {
        guard let data = storage.object(forKey: urlString as AnyObject) as? Data else { return nil }
        
        print("Load from cache")
        return data
    }
    
    func save(with urlString: String, and data: Data) {
        storage.setObject(data as AnyObject, forKey: urlString as AnyObject)
        print("Save in cache")
    }
}
