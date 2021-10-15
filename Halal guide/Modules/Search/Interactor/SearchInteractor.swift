//
//  SearchInteractor.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class SearchInteractor: SearchInteractorInput {
    
    private let presenter: SearchPresenterInput
    private let networkService: NetworkService
    
    init(networkService: NetworkService, presenter: SearchPresenterInput) {
        self.networkService = networkService
        self.presenter = presenter
    }
    
    func getApiUpdatedDate() {
        presenter.startLoading()
        var updatedDate: String?
        networkService.load(context: GetApiUpdateDateContext()) { [weak self] serverResponse in
            if DataHolder.shared.isPlacesExist() {
                self?.presenter.stopLoading()
                return
            }
            
            guard serverResponse.isSuccess else { return }
            guard let placesResponse: ResponsePlaces = serverResponse.decode() else { return }
            
            guard let items = placesResponse.data else { return }
            updatedDate = items[0].updated_at?.date
            if updatedDate == PhoneMemory.readApiUpdateDate() {
                DataHolder.shared.setPlaces(places: PhoneMemory.readPlaces())
                self?.presenter.setData(places: DataHolder.shared.getPlaces())
                self?.presenter.stopLoading()
            } else {
                self?.getPlaces()
            }
            PhoneMemory.saveApiUpdateDate(updateDate: updatedDate!)
        }
    }
    
    func getPlaces() {
        let context = GetPlacesContext()
        
        networkService.load(context: context) { [weak self] serverResponse in
            guard let interactor = self else { return }
            guard serverResponse.isSuccess else {
                interactor.presenter.stopLoading()
                let networkError: NetworkError
                if let description = serverResponse.json?["message"] as? String {
                    networkError = .serverError(description: description)
                } else {
                    networkError = serverResponse.networkError ?? .unknown
                }
                interactor.presenter.showError(networkError)
                return
            }
            guard let placesResponse: ResponsePlaces = serverResponse.decode() else {
                interactor.presenter.stopLoading()
                interactor.presenter.showError(NetworkError.dataLoad)
                return
            }
            
            guard let items = placesResponse.data else {
                return
            }
            
            DataHolder.shared.setPlaces(places: items)
            
            self?.presenter.setData(places: items)
            self?.presenter.stopLoading()
        }
    }
}
