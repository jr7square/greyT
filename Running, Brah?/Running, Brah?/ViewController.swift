//
//  ViewController.swift
//  Running, Brah?
//
//  Created by Stacy Kam on 10/15/16.
//  Copyright © 2016 GreyT. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationman: CLLocationManager!
    var destLocation: CLLocation!
    var currentUserLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        locationman = CLLocationManager()
        locationman.delegate = self
        locationman.desiredAccuracy = kCLLocationAccuracyBest
        locationman.requestAlwaysAuthorization()
        locationman.startUpdatingLocation()
        
        
    }
    
    func startDestLocation(userloc: CLLocation) {
        destLocation = userloc
    }
    
    

    func updateLocation(){
        currentUserLocation = locationman.location
    }
    
    func getCurrentlocation() ->(Double, Double) {
        var x_coordinate: Double
        var y_coordinate: Double
        x_coordinate = locationman.location!.coordinate.longitude
        y_coordinate = locationman.location!.coordinate.latitude
        
        return (x_coordinate, y_coordinate)
    }


}

