//
//  GistsViewController+UITableViewDataSource.swift
//  Github-Gists
//
//  Created by ApplePie on 21.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension GistsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let gist = presenter.getNeededGist(by: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Gist Cell", for: indexPath) as! GistTableViewCell
        cell.authorNameLabel.text = gist.owner.login
        cell.gistNameLabel.text = gist.description
        cell.avatarImageView.downloadImageIfNeeded(from: gist.owner.avatarURL)
        return cell
    }
}
