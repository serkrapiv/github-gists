//
//  GistViewController+UITableViewDataSource.swift
//  Github-Gists
//
//  Created by ApplePie on 21.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension GistsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Gist Cell", for: indexPath) as! GistTableViewCell
        let gist = gists[indexPath.row]
        cell.authorNameLabel.text = gist.owner.login
        cell.gistNameLabel.text = gist.description
        cell.avatarImageView.downloadImageIfNeeded(from: gist.owner.avatarURL)
        return cell
    }
}
