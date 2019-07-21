//
//  GistsViewController.swift
//  Github-Gists
//
//  Created by ApplePie on 20.07.19.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import UIKit

class GistsViewController: UIViewController {
    
    // MARK: - Fields
    
    lazy var gists = [Gist]()
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var topGistMakersCollectionView: UICollectionView!
    @IBOutlet weak var lastPublicGistTableView: UITableView!
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPublicGists()
    }

    
    // MARK: - Methods
    
    private func getPublicGists() {
        NetworkService(url: "https://api.github.com/gists/public")
            .connecting(responseHandler)
    }
    
    //
    // TODO: можно вынести в отдельный класс PublicGistsHandler
    //
    private func responseHandler(data: Data?, response: URLResponse?, error: Error?) {
        print("[...] Successful connection.")
        print("[...] Response was received by application.")
        guard let data = data, let _ = response else {
            print("Response or data is nil")
            return
        }
        
        serialize(json: data)
        print("[...] Successful serialization.")
        lastPublicGistTableView.reloadData()
    }
    
    private func serialize(json: Data) {
        Serializator.pull(data: json) { (json) in
            try self.decodePublicGists(from: json as! [[String: Any]])
        }
    }
    
    private func decodePublicGists(from json: [[String:Any]]) throws {
        for element in json {
            let gist = Gist()
            gist.comments = element["comments"] as? Int
            gist.commentsURL = element["comments_url"] as? String
            gist.commitsURL = element["commits_url"] as? String
            gist.createdAt = element["create_at"] as? String
            gist.description = element["description"] as? String
            gist.files = decodeFiles(element["files"] as? [String: Any])
            gist.forksURL = element["forks_url"] as? String
            gist.gitPullURL = element["git_pull_url"] as? String
            gist.gitPushURL = element["git_push_url"] as? String
            gist.htmlURL = element["html_url"] as? String
            gist.id = element["id"] as? String
            gist.nodeID = element["node_id"] as? String
            gist.owner = decodeOwner(element["owner"] as! [String: Any])
            gist.public = element["public"] as? Bool
            gist.truncated = element["truncated"] as? Bool
            gist.updateAt = element["update_at"] as? String
            gist.url = element["url"] as? String
            gist.user = element["user"] as? String
            gists.append(gist)
        }
    }
    
    private func decodeFiles(_ json: [String: Any]?) -> [File] {
        var files = [File]()
        guard let filesData = json else { return files }
        
        for elementData in filesData {
            guard let element = elementData.value as? [String: Any] else { return files }
            
            let file = File()
            file.filename = element["filename"] as? String
            file.language = element["language"] as? String
            file.rawURL = element["raw_url"] as? String
            file.size = element["size"] as? Int
            file.type = element["type"] as? String
            files.append(file)
        }
        return files
    }
    
    private func decodeOwner(_ ownerJSON: [String: Any]) -> Owner {
        let owner = Owner()
        owner.avatarURL = ownerJSON["avatar_url"] as? String
        owner.eventsURL = ownerJSON["events_url"] as? String
        owner.followersURL = ownerJSON["followers_url"] as? String
        owner.followingURL = ownerJSON["following_url"] as? String
        owner.gistsURL = ownerJSON["gists_url"] as? String
        owner.gravatarID = ownerJSON["gravatar_id"] as? String
        owner.htmlURL = ownerJSON["html_url"] as? String
        owner.id = ownerJSON["id"] as? Int
        owner.login = ownerJSON["login"] as? String
        owner.nodeID = ownerJSON["node_id"] as? String
        owner.organizationsURL = ownerJSON["organizations_url"] as? String
        owner.receivedEventsURL = ownerJSON["received_events_url"] as? String
        owner.reposURL = ownerJSON["repos_url"] as? String
        owner.siteAdmin = ownerJSON["site_admin"] as? Bool
        owner.starredURL = ownerJSON["starred_url"] as? String
        owner.subscriptionsURL = ownerJSON["subscriptions_url"] as? String
        owner.type = ownerJSON["type"] as? String
        owner.url = ownerJSON["url"] as? String
        return owner
    }
}






