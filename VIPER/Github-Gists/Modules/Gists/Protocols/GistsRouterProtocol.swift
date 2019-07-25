//
//  GistsRouterProtocol.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

protocol GistsRouterProtocol: class {
    
    func performSegue(withIdentifier identifier: String, sender: Gist)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
    
}
