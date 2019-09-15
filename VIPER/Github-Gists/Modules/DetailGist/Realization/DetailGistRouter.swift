//
//  DetailGistRouter.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class DetailGistRouter: DetailGistRouterProtocol {
    
    var viewController: DetailGistViewController!
    
    init(viewController: DetailGistViewController) {
        self.viewController = viewController
    }
    
}
