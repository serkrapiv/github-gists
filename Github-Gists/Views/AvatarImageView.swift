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
    
    
    // MARK: - Methods
    
    /// Load image from cache or download it from server
    func downloadImageIfNeeded(from urlString: String) {
        
        imageURLString = urlString
        
        // Clean before loading
        image = nil
        
        if !(loadImageFromCache(with: urlString)) {
            downloadImage(from: urlString)
        }
    }
    
    /// If image was found in cache, return true
    private func loadImageFromCache(with urlString: String) -> Bool {
        guard let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage else { return false }
        
        self.image = imageFromCache
        return true
    }
    
    /// Download image from server
    private func downloadImage(from urlString: String) {
        NetworkService(url: urlString).connecting(responseImageHandler)
    }
    
    
    // MARK: - Response Handler
    
    private func responseImageHandler(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data, let response = response else { return }
        let urlString = response.url?.absoluteString
        
        DispatchQueue.main.async {
            self.saveImageInCache(with: urlString, and: data)
        }
    }
    
    private func saveImageInCache(with urlString: String?, and data: Data) {
        let imageToCache = UIImage(data: data)
        
        if self.imageURLString == urlString {
            self.image = imageToCache
        }
        
        imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
    }
    
}
