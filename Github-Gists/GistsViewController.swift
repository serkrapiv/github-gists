//
//  GistsViewController.swift
//  Github-Gists
//
//  Created by ApplePie on 20.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class GistsViewController: UIViewController {
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPublicGists()
    }

    // MARK: - Methods
    
    private func getPublicGists() {
        NetworkService(url: "https://api.github.com/gists/public").connecting { (data, response, error) in
            guard let data = data, let response = response else {
                print("Response or data is nil")
                return
            }
            
            do {
                let dict = try JSONSerialization.jsonObject(with: data, options: [])
                print(dict)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
