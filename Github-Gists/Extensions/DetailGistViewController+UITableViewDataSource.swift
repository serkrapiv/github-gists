//
//  DetailGistViewController+UITableViewDataSource.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 23/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension DetailGistViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Commit Cell", for: indexPath) as! CommitTableViewCell
        let commit = commits[indexPath.row]
        cell.additionsLabel.text = "+" + String(commit.status.additions)
        cell.deletionsLabel.text = "-" + String(commit.status.deletions)
        cell.dateLabel.text = commit.committedAt
        return cell
    }
}
