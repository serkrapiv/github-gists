//
//  DetailGistViewController.swift
//  Github-Gists
//
//  Created by ApplePie on 20.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class DetailGistViewController: UIViewController, DetailGistViewProtocol {
    
    // MARK: - Fields
    
    var gist: Gist!
    var presenter: DetailGistPresenterProtocol!
    var configurator: DetailGistConfiguratorProtocol = DetailGistConfigurator()
    

    // MARK: - Outlets

    @IBOutlet weak var avatarImageView: AvatarImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var gistNameLabel: UILabel!
    @IBOutlet weak var contentGistTextView: ContentTextView!
    @IBOutlet weak var heightConstraintOfContentGistTextView: NSLayoutConstraint!
    @IBOutlet weak var commitsTableView: UITableView!
    @IBOutlet weak var heightConstraintOfCommitTableView: NSLayoutConstraint!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.downloadCommits(for: gist)
        
        setupPrimaryDataForControls()
        downloadContentOfGist()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupNeededLayoutForContentTextView()
    }
    
    
    // MARK: - DetailGistViewProtocol methods
    
    func resizeCommitTable(for commitsCount: Int) {
        heightConstraintOfCommitTableView.constant = CGFloat(commitsCount) * commitsTableView.rowHeight
        commitsTableView.reloadData()
    }
    
    // MARK: - Private methods
    
    
    private func setupPrimaryDataForControls() {
        avatarImageView.downloadImageIfNeeded(from: gist.owner.avatarURL)
        authorNameLabel.text = gist.owner.login
        gistNameLabel.text = gist.description
        contentGistTextView.layer.cornerRadius = 8
    }
    
    private func setupNeededLayoutForContentTextView() {
        heightConstraintOfContentGistTextView.constant = contentGistTextView.contentSize.height
        contentGistTextView.sizeToFit()
        view.layoutIfNeeded()
    }
    
    private func downloadContentOfGist() {
        contentGistTextView.addContent(from: gist)
    }
    
}
