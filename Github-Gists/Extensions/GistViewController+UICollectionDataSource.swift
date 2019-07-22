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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Avatar Cell", for: indexPath) as! AvatarCollectionViewCell
        
        guard !(gists.isEmpty) else {
            cell.avatarImageView.image = UIImage()
            cell.nameLabel.text = String()
            return cell
        }
        
        let gist = gists[indexPath.row]
        cell.avatarImageView.downloadImageIfNeeded(from: gist.owner.avatarURL)
        cell.nameLabel.text = gist.owner.login
        return cell
    }
}
