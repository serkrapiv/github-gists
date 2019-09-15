//
//  GistsInteractor.swift
//  Github-Gists
//
//  Created by Victor Volnukhin on 25/07/2019.
//  Copyright © 2019 VictorVolnukhin. All rights reserved.
//

import Foundation

class GistsInteractor: GistsInteractorProtocol {
    
    // MARK: - Fields
    
    lazy var gists = [Gist]()
    lazy var topGistMakers = [Owner?]()
    lazy var sortedGists = [Gist]()
    
    weak var presenter: GistsPresenterProtocol!
    let networkService: NetworkServiceProtocol
    let serializationService: SerializatorProtocol
    let decodingService: DecoderProtocol
    
    
    // MARK: - Inits
    
    init(presenter: GistsPresenterProtocol) {
        self.presenter = presenter
        self.networkService = NetworkService(urlString: AppConstant.api.gists)
        self.serializationService = Serializator()
        self.decodingService = GGDecoder()
    }
    
    
    // MARK: - Methods
    

    
    private func responseHandler(data: Data?, response: URLResponse?, error: Error?) {
        print("[...] Successful connection.")
        print("[...] Response was received by application.")
        guard data != nil && !(data!.isEmpty) else {
            print("Response or data is nil or empty")
            return
        }
        
        serializationService.pull(data: data!) { (json) in
            print(json)
        }
        
        decodingService.decode {
            self.gists = try JSONDecoder().decode(Array<Gist>.self, from: data!)
        }
        updateUIControls()
    }
    
    private func updateUIControls() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.updateGistMakers()
            self.presenter.enableControls()
        })
    }
    
    
    // MARK: -  GistsInteractorProtocol methods
    
    func requestPublicGists() {
        networkService.connecting(responseHandler)
    }
    
    func sortGistsByOwner(with index: Int) {
        let chosenOwner = topGistMakers[index]
        sortedGists = gists.filter { $0.owner == chosenOwner }
    }
    
    
    // MARK: - Private methods
    
    private func updateGistMakers(top: Int = 10) {
        
        let allGistMakers = Dictionary(grouping: gists) { $0.owner }
            .mapValues { (value: [Gist]) in return value.count }
            .sorted(by: {$0.1 > $1.1})
            .map { $0.key }
        
        topGistMakers = Array(allGistMakers.prefix(top))
    }
    
}
