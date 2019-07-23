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
    
    
    // MARK: - Outlets

    @IBOutlet weak var avatarImageView: AvatarImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var gistNameLabel: UILabel!
    @IBOutlet weak var contentGistTextView: ContentTextView!
    @IBOutlet weak var heightConstraintOfContentGistTextView: NSLayoutConstraint!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImageView.downloadImageIfNeeded(from: gist.owner.avatarURL)
        authorNameLabel.text = gist.owner.login
        gistNameLabel.text = gist.description
        contentGistTextView.layer.cornerRadius = 8
        contentGistTextView.addContent(from: gist)

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        heightConstraintOfContentGistTextView.constant = contentGistTextView.contentSize.height
        contentGistTextView.sizeToFit()
        view.layoutIfNeeded()
    }
    
    
    // MARK: - Methods
    

}
