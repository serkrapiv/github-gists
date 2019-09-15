//
//  GistsViewController+UICollectionViewDelegate.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 24/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension GistsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let chosenOwner = topGistMakers[indexPath.row]
        sortedGists = gists.filter { $0.owner == chosenOwner }
        lastPublicGistTableView.reloadData()
    }
}
