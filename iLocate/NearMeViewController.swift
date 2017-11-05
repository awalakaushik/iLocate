//
//  NearMeViewController.swift
//  iLocate
//
//  Created by Kaushik Reddy Awala on 11/2/17.
//  Copyright © 2017 TeamTwo. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class NearMeViewController: UIViewController, CLLocationManagerDelegate {

    let manager = CLLocationManager()
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LocateMe()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last //may be last known location??
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        map.setRegion(region, animated: true)
        //stop updating the location because you only need current location
        manager.stopUpdatingLocation()
        self.map.showsUserLocation = true
    }
    
    func LocateMe() {
        //set the delegate to be self
        manager.delegate = self
        //set the desired accuracy
        manager.desiredAccuracy = kCLLocationAccuracyBest
        //ask for location permission when in use
        manager.requestWhenInUseAuthorization()
        //update location as the user keeps moving
        manager.startUpdatingLocation()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
