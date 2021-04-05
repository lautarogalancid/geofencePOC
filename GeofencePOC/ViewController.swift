//
//  ViewController.swift
//  GeofencePOC
//
//  Created by Koison on 05/04/2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    lazy var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: -31.417, longitude: -64.183), radius: 100, identifier: "Cordoba")
        locationManager.startMonitoring(for: region)

    }
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let authorizationStatus = manager.authorizationStatus
        if authorizationStatus != .authorizedAlways {
            let alert = UIAlertController(title: title, message: "'Always' Geolocation permission required to use this app", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
}
