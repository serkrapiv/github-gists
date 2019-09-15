//
//  DetailGistInteractorProtocol.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

protocol DetailGistInteractorProtocol: class {
    
    var commits: [Commit] { get set }
    
    func downloadCommits(for gist: Gist)
    
}
