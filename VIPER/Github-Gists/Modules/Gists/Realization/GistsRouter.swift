//
//  GistsRouter.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class GistsRouter: GistsRouterProtocol {
    
    var viewController: GistsViewController!
    
    init(viewController: GistsViewController) {
        self.viewController = viewController
    }

    func performSegue(withIdentifier identifier: String, sender: Gist) {
        viewController.performSegue(withIdentifier: identifier, sender: sender)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailGistView = segue.destination as! DetailGistViewController
        detailGistView.gist = sender as? Gist
    }
}
