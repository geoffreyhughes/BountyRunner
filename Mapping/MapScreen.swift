//
//  ViewController.swift
//  Mapping
//
//  Created by Geoffrey Hughes on 11/9/20.
//  Copyright © 2020 Geoffrey Hughes. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapScreen: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        print("view did load")
        super.viewDidLoad()
        
        checkLocationServices()
        
        // Do any additional setup after loading the view.
    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            // setup our location manager
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // TODO: Setup alert telling user they have to enable location services
            
        }
    }
    
    func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
            
            // May need to require authorized always for my app..
            
        case .authorizedWhenInUse:
            // do map stuff
            break
        case .denied:
            // Show alert of how to enable permissions - cant do anything otherwise
            break
        case .notDetermined:
            // as opposed to: locationManager.requestWhenInUseAuthorization()
            //locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            // Show alert saying this app requires location services, and must enable to continue
            break
        case .authorizedAlways:
            break
        @unknown default:
            fatalError()
        }
    }


}

extension MapScreen: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Do something every time the location updates
        // We'll be back
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Do something every time the authorization changes
        // We'll be back
    }
}


