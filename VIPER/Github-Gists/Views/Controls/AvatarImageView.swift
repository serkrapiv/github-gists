//
//  AvatarImageView.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 22/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class AvatarImageView: UIImageView {
    
    // MARK: - Fields
    
    var imageURLString: String?
    var networkService: NetworkServiceProtocol!
    var cacheService: CacheServiceProtocol = Cache()
    
    
    // MARK: - Methods
    
    /// Load image from cache or download it from server
    func downloadImageIfNeeded(from urlString: String) {
        
        imageURLString = urlString
        
        // Clean before loading
        image = nil
        
        if let data = cacheService.load(by: urlString) {
            image = UIImage(data: data)
        } else {
            downloadImage(from: urlString)
        }
    }
    
    
    
    /// Download image from server
    private func downloadImage(from urlString: String) {
        networkService = NetworkService(urlString: urlString)
        networkService.connecting(responseImageHandler)
    }
    
    
    // MARK: - Response Handler
    
    private func responseImageHandler(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data, let response = response else { return }
        guard let urlString = response.url?.absoluteString else { return }
        
        DispatchQueue.main.async {
            let imageToCache = UIImage(data: data)
            
            if self.imageURLString == urlString {
                self.image = imageToCache
            }
            
            self.cacheService.save(with: urlString, and: data)
        }
    }
    
    
    
}
