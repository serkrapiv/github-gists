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
    lazy var topGistMakers = [Owner?]()
    lazy var sortedGists = [Gist]()
    var chosenGist: Gist!
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var topGistMakersCollectionView: UICollectionView!
    @IBOutlet weak var lastPublicGistTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Вопрос обновления:
        // Можно было бы перенести запрос в viewWillAppear, чтобы при переходе
        // на данный экран происходило обновление, но раз пользователь возвращается
        // к списку, то, возможно, он хочет посмотреть один из гистов, которые
        // уже видел в списке, а т.к. публичных гистов много, и они очень часто
        // создаются, то пользователь может не найти того самого, за котором перешёл
        // обратно в список.
        getPublicGists()
    }

    
    // MARK: - Methods
    
    private func getPublicGists() {
        NetworkService(url: "https://api.github.com/gists/public")
            .connecting(responseHandler)
    }
    
    private func responseHandler(data: Data?, response: URLResponse?, error: Error?) {
        print("[...] Successful connection.")
        print("[...] Response was received by application.")
        guard data != nil && !(data!.isEmpty) else {
            print("Response or data is nil or empty")
            return
        }
        
        Serializator.pull(data: data!) { (json) in
            print(json)
        }
        
        GGDecoder.decode {
            self.gists = try JSONDecoder().decode(Array<Gist>.self, from: data!)
        }
        updateTableView()
    }
    
    private func updateTableView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.lastPublicGistTableView.reloadData()
            self.activityIndicatorView.stopAnimating()
            self.lastPublicGistTableView.isHidden = false
            self.createCollectionView()
        })
    }
    
    private func createCollectionView() {
        
        let allGistMakers = Dictionary(grouping: gists) { $0.owner }
                            .mapValues { (value: [Gist]) in return value.count }
                            .sorted(by: {$0.1 > $1.1})
                            .map { $0.key }
        
        topGistMakers = Array(allGistMakers.prefix(10))
        
        updateCollectionView()
    }
    
    private func updateCollectionView() {
        topGistMakersCollectionView.reloadData()
        topGistMakersCollectionView.isHidden = false
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailedGistView" {
            let detailedView = segue.destination as! DetailGistViewController
            detailedView.gist = self.chosenGist
        }
    }
}






