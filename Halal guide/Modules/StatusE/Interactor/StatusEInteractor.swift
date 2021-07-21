//
//  StatusEInteractor.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class StatusEInteractor: StatusEInteractorInput {
    
    private let presenter: StatusEPresenterInput
    private let networkService: NetworkService
    
    init(networkService: NetworkService, presenter: StatusEPresenterInput){
        self.networkService = networkService
        self.presenter = presenter
    }

    func getAdditions() {
        presenter.startLoading()
        let context = GetAdditionsContext()
        networkService.load(context: context) { [weak self] serverResponse in
            guard let interactor = self else { return }
            guard serverResponse.isSuccess else {
                interactor.presenter.stopLoading()
                let networkError: NetworkError
                if let description = serverResponse.json? ["message"] as? String {
                    networkError = .serverError(description: description)
                } else {
                    networkError = serverResponse.networkError ?? .unknown
                }
                interactor.presenter.showError(networkError)
                return
            }
            guard let additionsResponse: ResponseAdditions = serverResponse.decode() else {
                interactor.presenter.stopLoading()
                interactor.presenter.showError(NetworkError.dataLoad)
                return
            }
            
            guard let items = additionsResponse.data else {
                return
            }
            
            self?.presenter.setData(additions: items)
            self?.presenter.stopLoading()
        }
    }
}
