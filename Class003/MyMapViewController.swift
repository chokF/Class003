//
//  MyMapViewController.swift
//  Class003
//
//  Created by L20102 on 2019/6/3.
//  Copyright © 2019 L20102-02. All rights reserved.
//

import UIKit

import MapKit
import CoreLocation

class MyMapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    
    
    var locationManager: CLLocationManager!
    
    let  regionRadivs : CLLocationDirection = 10000

    @IBOutlet weak var myMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager = CLLocationManager()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization()
        
        if(CLLocationManager.locationServicesEnabled()){
            locationManager.startUpdatingLocation()
        }
        
        myMapView.delegate = self
        myMapView.showsUserLocation = true

        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let loc: CLLocation = locations[0] as CLLocation
        
        DispatchQueue.main.async {
            self.centerLocation(location: loc)
        }
        
    }
    
    func centerLocation(location:CLLocation){
        let region = MKCoordinateRegion(center: location.coordinate,latitudinalMeters: regionRadivs,longitudinalMeters: regionRadivs)
        
        DispatchQueue.main.async {
            self.myMapView.setRegion(region, animated: true)
        }
        
    }


}
