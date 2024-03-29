//
//  CateringViewController.swift
//  Halal guide
//
//  Created by Bagdat Zhunisbekov on 07.01.2021.
//  Copyright © 2021 Halaldamu. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps

class CateringViewController: BaseViewController {
    
    var router: CateringRouterInput?
    var interactor: CateringInteractorInput?
    
    private let mapView = GMSMapView()
    private let segmentedControl = UISegmentedControl(items: ["Питание", "Магазины"])
    
    private var markerHintShown = false
    private var infoWindowHintShown = false
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        mapView.delegate = self
        
        self.navigationItem.largeTitleDisplayMode = .never
        
        interactor?.getCafes()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !markerHintShown {
            showToast(message: "Нажмите на красную точку, что бы увидеть информацию.")
        }
    }
    
    private func setupViews() {
        title = "Карта"
        
        view.backgroundColor = .white
        view.addSubview(mapView)
        
        locationManager.delegate = self
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
            
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.tintColor = UIColor.yellow
        segmentedControl.backgroundColor = AppColor.green.uiColor
        segmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        mapView.addSubview(segmentedControl)
    }
    
    private func setConstraints() {
        var layoutConstraints = [NSLayoutConstraint]()
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leftAnchor.constraint(equalTo: view.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: view.rightAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        layoutConstraints += [
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: UIConstants.defaultPadding),
            segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: UIConstants.defaultPadding),
            segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -1 * UIConstants.defaultPadding),
            segmentedControl.heightAnchor.constraint(equalToConstant: 45.0)
        ]
        
        NSLayoutConstraint.activate(layoutConstraints)
    }
    
    @objc func segmentedValueChanged(_ sender: UISegmentedControl!) {
        switch sender.selectedSegmentIndex {
        case 0: // Питание
            interactor?.getCafes()
        case 1: //Магазины
            interactor?.getShops()
        default:
            interactor?.getCafes()
        }
    }
}

extension CateringViewController: CateringViewInput {
    
    func setCafes(cafes: [PlaceViewModel]) {
        mapView.clear()
        cafes.forEach { place in
            setMarker(place: place)
        }
    }
    
    func setShops(shops: [PlaceViewModel]) {
        mapView.clear()
        shops.forEach { place in
            setMarker(place: place)
        }
    }
    
    func setMosqueLocations(mosques: [MosqueLocation]) {
        mapView.clear()
        mosques.forEach { mosqueLocation in
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: Double(mosqueLocation.lat ?? "0.0") ?? .zero, longitude: Double(mosqueLocation.lng ?? "0.0") ?? .zero)
            marker.title = mosqueLocation.title
            marker.snippet = mosqueLocation.address
            marker.map = mapView
        }
    }
    
    private func setMarker(place: PlaceViewModel) {
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)
        marker.title = place.title
        marker.snippet = place.address
        marker.accessibilityHint = place.link! //todo extend GMSMarker, add mapLink field
        marker.map = mapView
    }
}

extension CateringViewController: MainTabBarItemPageRouterInput {
    
    func reloadPage() {
        
    }
}

// MARK: - CLLocationManagerDelegate
extension CateringViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.requestLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        mapView.camera = GMSCameraPosition(
            target: location.coordinate,
            zoom: 15,
            bearing: 0,
            viewingAngle: 0)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension CateringViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        markerHintShown = true
        if !infoWindowHintShown {
            showToast(message: "Нажмите на инфо-окошко, что бы открыть на более подробной карте.")
        }
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        infoWindowHintShown = true
        if let url = URL(string: marker.accessibilityHint!) {
            UIApplication.shared.open(url)//todo test it
        } else {
            showToast(message: "Не удалось открыть на подробной карте(((")
        }
    }
    
}

