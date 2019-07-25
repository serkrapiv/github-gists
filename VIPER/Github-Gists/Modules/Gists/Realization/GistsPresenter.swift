//
//  GistsPresenter.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class GistsPresenter: GistsPresenterProtocol {
    
    // MARK: - Fields
    
    weak var view: GistsViewProtocol!
    var interactor: GistsInteractorProtocol!
    var router: GistsRouterProtocol!
    
    
    // MARK: - Properties
    
    var numberOfRowsInSection: Int {
        guard interactor.sortedGists.isEmpty else { return interactor.sortedGists.count }
        return interactor.gists.count
    }
    
    var topGistMakersCount: Int {
        return interactor.topGistMakers.count
    }
    
    
    // MARK: - Inits
    
    init(view: GistsViewProtocol) {
        self.view = view
    }
    
    
    // MARK: - Methods
    
    func requestServerData() {
        interactor.requestPublicGists()
    }
    
    func getNeededGist(by index: Int) -> Gist {
        return interactor.sortedGists.isEmpty ? interactor.gists[index] : interactor.sortedGists[index]
    }
    
    func getNeededOwner(by index: Int) -> Owner? {
        return interactor.topGistMakers[index]
    }
    
    func sortGistsByOwner(with index: Int) {
        interactor.sortGistsByOwner(with: index)
    }
    
    func enableControls() {
        view.enableControls()
    }
}
