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
        let chosenGist = presenter.getNeededGist(by: indexPath.row)
        presenter.router.performSegue(withIdentifier: AppConstant.segues.toDetaiedView, sender: chosenGist)
    }
}
