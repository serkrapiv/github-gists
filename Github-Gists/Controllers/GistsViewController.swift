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
        
        GGDecoder.decode {
            self.gists = try JSONDecoder().decode(Array<Gist>.self, from: data)
            self.updateTableView()
        }
        print("[...] Successful decoding.")
    }
    
    private func updateTableView() {
        DispatchQueue.main.async {
            self.lastPublicGistTableView.reloadData()
        }
    }
    
}






