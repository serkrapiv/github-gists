//
//  GistViewController+UICollectionDataSource.swift
//  Github-Gists
//
//  Created by ApplePie on 21.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

extension GistsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topGistMakers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Avatar Cell", for: indexPath) as! AvatarCollectionViewCell
        
        let owner = topGistMakers[indexPath.row]
        if let avatarUrlString = owner?.avatarURL {
            cell.avatarImageView.downloadImageIfNeeded(from: avatarUrlString)
        }
        cell.nameLabel.text = owner?.login ?? String()
        return cell
    }
}
