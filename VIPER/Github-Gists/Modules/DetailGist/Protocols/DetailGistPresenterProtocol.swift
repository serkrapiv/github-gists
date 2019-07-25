//
//  DetailGistPresenterProtocol.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

protocol DetailGistPresenterProtocol: class {
    
    var router: DetailGistRouterProtocol! { get set }
    
    var numberOfRowsInSection: Int { get }
    
    func downloadCommits(for gist: Gist)
    func getNeededCommit(by index: Int) -> Commit
    func enableControls()
    
}
