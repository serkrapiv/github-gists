//
//  Network.swift
//  Github-Gists
//
//  Created by ApplePie on 21.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class NetworkService: NetworkServiceProtocol {
    
    // MARK: - Fields
    
    private var url: String
    
    
    // MARK: - Typealias
    
    typealias ResponseHandler = ((_ : Data?, _ : URLResponse?, _ : Error?) -> Void)
    
    
    // MARK: - Initializers
    
    init(url: String) {
        print("[...] Try to connect by URL (\(url))...")
        self.url = url
    }
    
    
    // MARK: - Functions
    
    func connecting(_ handler: @escaping ResponseHandler) {
        guard let url = URL(string: self.url) else {
            print("Could not make the correct URL.")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: handler).resume()
    }
    
}
