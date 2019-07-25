//
//  ContentTextView.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 23/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class ContentTextView: UITextView {
    
    // MARK: = Fields
    
    var networkService: NetworkServiceProtocol!
    
    func addContent(from gist: Gist) {
        text = String()
        
        for file in gist.files {
            text += file.key
            downloadContent(from: file.value.rawURL)
        }
    }
    
    private func downloadContent(from urlString: String) {
        networkService = NetworkService(urlString: urlString)
        networkService.connecting(responseContentHandler)
    }
    
    private func responseContentHandler(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data, let _ = response else { return }
        
        if let newcontent = String(data: data, encoding: .utf8) {
            
            DispatchQueue.main.async {
                self.text = self.text + "\n" + newcontent
                self.sizeToFit()
                self.layoutIfNeeded()
            }
        }
    }
}
