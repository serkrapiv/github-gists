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
    
    var urlString: String
    
    
    // MARK: - Typealias
    
    typealias ResponseHandler = ((_ : Data?, _ : URLResponse?, _ : Error?) -> Void)
    
    
    // MARK: - Initializers
    
    init() {
        urlString = String()
    }
    
    init(urlString: String) {
        print("[...] Try to connect by URL (\(urlString))...")
        self.urlString = urlString
    }
    
    
    // MARK: - Functions
    
    func connecting(_ handler: @escaping ResponseHandler) {
        guard let url = URL(string: urlString) else {
            print("Could not make the correct URL.")
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: handler).resume()
    }
    
}
