//
//  DetailGistInteractor.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class DetailGistInteractor: DetailGistInteractorProtocol {
    
    // MARK: - Fields
    
    weak var presenter: DetailGistPresenterProtocol!
    
    lazy var commits = [Commit]()
    
    let networkService: NetworkServiceProtocol
    let serializationService: SerializatorProtocol
    let decodingService: DecoderProtocol
    
    
    // MARK: - Inits
    
    init(presenter: DetailGistPresenterProtocol) {
        self.presenter = presenter
        self.networkService = NetworkService()
        self.serializationService = Serializator()
        self.decodingService = GGDecoder()
    }
    
    
    // MARK: - Methods
    
    func downloadCommits(for gist: Gist) {
        networkService.urlString = gist.commitsURL
        networkService.connecting(responseCommitHandler)
    }
    
    private func responseCommitHandler(data: Data?, response: URLResponse?, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        guard let data = data, let _ = response else { return }
        
        serializationService.pull(data: data) { (json) in
            print(json)
        }
        
        decodingService.decode {
            self.commits = try JSONDecoder().decode(Array<Commit>.self, from: data)
        }
        updateCommitsTableView()
    }
    
    private func updateCommitsTableView() {
        DispatchQueue.main.async {
            self.presenter.enableControls()
        }
    }
}
