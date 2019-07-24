//
//  DetailGistViewController.swift
//  Github-Gists
//
//  Created by ApplePie on 20.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class DetailGistViewController: UIViewController {
    
    // MARK: - Fields
    
    var gist: Gist!
    lazy var commits = [Commit]()
    
    
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
        setupPrimaryDataForControls()
        downloadContentOfGist()
        downloadCommitsForGist()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupNeededLayoutForContentTextView()
    }
    
    
    // MARK: - Methods
    
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
    
    private func downloadCommitsForGist() {
        NetworkService(url: gist.commitsURL).connecting(responseCommitHandler)
    }
    
    private func responseCommitHandler(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data, let _ = response else { return }
        
        Serializator.pull(data: data) { (json) in
            print(json)
        }
        
        GGDecoder.decode {
            self.commits = try JSONDecoder().decode(Array<Commit>.self, from: data)
        }
        updateCommitsTableView()
    }
    
    private func updateCommitsTableView() {
        DispatchQueue.main.async {
            self.heightConstraintOfCommitTableView.constant = CGFloat(self.commits.count) * self.commitsTableView.rowHeight
            self.commitsTableView.reloadData()
        }
    }
}
