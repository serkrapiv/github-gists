//
//  DetailGistConfigurator.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class DetailGistConfigurator: DetailGistConfiguratorProtocol {
    func configure(with viewController: DetailGistViewController) {
        let presenter = DetailGistPresenter(view: viewController)
        let interactor = DetailGistInteractor(presenter: presenter)
        let router = DetailGistRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
