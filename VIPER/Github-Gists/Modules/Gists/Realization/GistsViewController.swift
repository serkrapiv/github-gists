//
//  GistsViewController.swift
//  Github-Gists
//
//  Created by ApplePie on 20.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class GistsViewController: UIViewController, GistsViewProtocol {
    
    // MARK: - Fields
    
    var presenter: GistsPresenterProtocol!
    var configurator: GistsConfiguratorProtocol = GistsConfigurator()
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var topGistMakersCollectionView: UICollectionView!
    @IBOutlet weak var lastPublicGistTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.requestServerData()
    }
    
    
    // MARK: - Methods
    
    func enableControls() {
        activityIndicatorView.stopAnimating()
        updateTableView()
        updateCollectionView()
    }
    
    private func updateTableView() {
        lastPublicGistTableView.reloadData()
        lastPublicGistTableView.isHidden = false
    }
    
    private func updateCollectionView() {
        topGistMakersCollectionView.reloadData()
        topGistMakersCollectionView.isHidden = false
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        presenter.router.prepare(for: segue, sender: sender)
    }
}






