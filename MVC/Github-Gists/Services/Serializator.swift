//
//  Serializator.swift
//  Github-Gists
//
//  Created by ApplePie on 21.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class Serializator {
    
    static func pull(data: Data, _ serializationHandler: (Any) throws -> ()) {
        print("[...] Try to serialize json...")
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            try serializationHandler(json)
        }
            
        catch let error {
            print(error.localizedDescription)
        }
    }
}
