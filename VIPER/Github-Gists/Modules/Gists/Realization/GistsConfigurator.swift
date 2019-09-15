//
//  GistsConfigurator.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class GistsConfigurator: GistsConfiguratorProtocol {
    func configure(with viewController: GistsViewController) {
        let presenter = GistsPresenter(view: viewController)
        let interactor = GistsInteractor(presenter: presenter)
        let router = GistsRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
