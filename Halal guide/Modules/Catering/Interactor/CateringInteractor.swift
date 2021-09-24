//
//  CateringInteractor.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation

class CateringInteractor: CateringInteractorInput {
    
    private let presenter: CateringPresenterInput
    private let networkService: NetworkService

    private var mosques = [Mosque]()
    private var mosqueLocations = [MosqueLocation]()
    private var page = 1
    
    init(networkService: NetworkService, presenter: CateringPresenterInput) {
        self.presenter = presenter
        self.networkService = networkService
    }    

    func getCafes() {
        let places = DataHolder.shared.places
        var items = [PlaceViewModel]()
        let cafes = places?.filter { $0.category?.slug == "tamaqtanu-oryndary" || $0.category?.slug == "fast-fud-onimderi"}

        cafes?.forEach({ place in
            if let mapLinks = place.maplink {
                
                mapLinks.forEach({ mapLink in
                    
                    guard let link = mapLink.link else { return }
                    
                    let latlng = LatLng(link: link)
                    
                    let placeViewModel = PlaceViewModel(
                        longitude: latlng.longitude,
                        latitude: latlng.latitude,
                        address: mapLink.address,
                        link: mapLink.link,
                        title: place.trademark_title
                    )
                    items.append(placeViewModel)
                    
                })
            }
            
        })
        
        presenter.setCafes(cafes: items)
    }
    
    func getShops() {
        let places = DataHolder.shared.places
        var items = [PlaceViewModel]()
        let shops = places?.filter { $0.category?.slug == "et-dukeni"}
        shops?.forEach({ place in
            if let mapLinks = place.maplink {
                mapLinks.forEach({ mapLink in
                    
                    guard let link = mapLink.link else { return }
                    
                    let latlng = LatLng(link: link)
                    
                    let placeViewModel = PlaceViewModel(
                        longitude: latlng.longitude,
                        latitude: latlng.latitude,
                        address: mapLink.address,
                        link: mapLink.link,
                        title: place.trademark_title
                    )
                    items.append(placeViewModel)
                    
                })
            }
        })
        presenter.setShops(shops: items)
    }
    
    func getMosques() {
        if (!mosqueLocations.isEmpty) {
            presenter.setMosqueLocations(mosques: mosqueLocations)
            return
        }
                
        let context = GetMosquesContext(page: page)
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
            guard let mosquesResponse: ResponseMosqueList = serverResponse.decode() else {
                interactor.presenter.stopLoading()
                interactor.presenter.showError(NetworkError.dataLoad)
                return
            }
            
            mosquesResponse.results?.forEach({ mosque in
                self?.mosques.append(mosque)
            })
            
            guard let next: String = mosquesResponse.next else {
                DataHolder.shared.mosques = self?.mosques
                self?.mosques.forEach({ mosque in
                    self?.getMosqueLocations(id: String(mosque.id ?? 0))
                })
                return
            }
            
            self?.page += 1
            self?.getMosques()
        }
    }
    
    private func getMosqueLocations(id: String) {
        if (mosqueLocations.count == mosques.count || mosqueLocations.count == mosques.count-1) {
            presenter.stopLoading()
            DataHolder.shared.mosqueLocations = mosqueLocations
            presenter.setMosqueLocations(mosques: mosqueLocations)
            return
        }

        let contextMosqueLocations = GetMosqueLocationContext(id: ""+id)
        networkService.load(context: contextMosqueLocations) { [weak self] serverResponse in
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
            guard let mosquesResponse: MosqueLocation = serverResponse.decode() else {
                interactor.presenter.stopLoading()
                interactor.presenter.showError(NetworkError.dataLoad)
                return
            }
            
            self?.mosqueLocations.append(mosquesResponse)
        }
    }
}
