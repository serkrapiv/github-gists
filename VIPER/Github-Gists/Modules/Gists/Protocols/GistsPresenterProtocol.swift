//
//  GistsPresenterProtocol.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

protocol GistsPresenterProtocol: class {
    
    var router: GistsRouterProtocol! { get set }
    
    var numberOfRowsInSection: Int { get }
    var topGistMakersCount: Int { get }
    
    func requestServerData()
    func getNeededGist(by index: Int) -> Gist
    func getNeededOwner(by index: Int) -> Owner?
    func sortGistsByOwner(with index: Int)
    func enableControls()
    
}
