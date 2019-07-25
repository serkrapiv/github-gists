//
//  DetailGistPresenter.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class DetailGistPresenter: DetailGistPresenterProtocol {
    
    // MARK: - Fields
    
    weak var view: DetailGistViewProtocol!
    var interactor: DetailGistInteractorProtocol!
    var router: DetailGistRouterProtocol!
    
    
    // MARK: - Properties
    
    var numberOfRowsInSection: Int {
        return interactor.commits.count
    }
    
    
    // MARK: - Inits
    
    init(view: DetailGistViewProtocol) {
        self.view = view
    }
    
    
    // MARK: - Methods
    
    func downloadCommits(for gist: Gist) {
        interactor.downloadCommits(for: gist)
    }
    
    func getNeededCommit(by index: Int) -> Commit {
        return interactor.commits[index]
    }
    
    func enableControls() {
        view.resizeCommitTable(for: interactor.commits.count)
    }
}
