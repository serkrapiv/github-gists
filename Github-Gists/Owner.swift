//
//  Owner.swift
//  Github-Gists
//
//  Created by ApplePie on 20.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class Owner {
    let name: String
    var avatarUrl: URL!
    var avatarImage: UIImage!
    
    init(name: String, avatarUrl: String) {
        self.name = name
        if let url = URL(string: avatarUrl) {
            self.avatarUrl = url
        }
    }
}
