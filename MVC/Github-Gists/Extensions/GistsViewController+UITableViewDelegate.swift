//
//  GistsViewController+UITableViewDelegate.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 23/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension GistsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenGist = sortedGists.isEmpty ? gists[indexPath.row] : sortedGists[indexPath.row]
        performSegue(withIdentifier: AppConstant.segues.toDetaiedView, sender: self)
    }
}
