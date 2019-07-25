//
//  GistsInteractorProtocol.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

protocol GistsInteractorProtocol: class {
    
    var gists: [Gist] { get set }
    var sortedGists: [Gist] { get set }
    var topGistMakers: [Owner?] { get set }
    
    func requestPublicGists()
    func sortGistsByOwner(with index: Int)
    
}
