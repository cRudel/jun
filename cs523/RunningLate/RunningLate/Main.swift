//
//  ViewController.swift
//  RunningLate
//
//  Created by Chris Rudel on 2/25/19.
//  Copyright © 2019 Chris Rudel. All rights reserved.
//
//  Still need to design the core functionality of the app


import UIKit
import MapKit
import CoreLocation


class Main: UIViewController, CLLocationManagerDelegate {
    
    var HomeLocation: MKPointAnnotation?
    var AvailContacts: [Person] = []
    
    @IBAction func contactsBtn(_ sender: Any) {
        performSegue(withIdentifier: "contacts", sender: self)
    }
    
    @IBAction func messagesBtn(_ sender: Any) {
        performSegue(withIdentifier: "messages", sender: self)
    }
    @IBAction func calendarBtn(_ sender: Any) {
        performSegue(withIdentifier: "calendar", sender: self)
    }
    
    @IBAction func setHomeBtn(_ sender: Any) {
        if(HomeLocation == nil){
            let location = manager.location!
            HomeLocation = MKPointAnnotation()
            HomeLocation?.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            HomeLocation?.title = "Home"
            self.map.addAnnotation(HomeLocation!)
        }else{
            self.map.removeAnnotation(HomeLocation!)
            let location = manager.location!
            HomeLocation = MKPointAnnotation()
            HomeLocation?.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            HomeLocation?.title = "Home"
            self.map.addAnnotation(HomeLocation!)
        }
        
    }
    
    @IBOutlet weak var map: MKMapView!
    let manager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0] //locations is a stack of the most recent user locations
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01) //how zoomed in the map is
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation,span: span)
        
        map.setRegion(region, animated: true)
        
        self.map.showsUserLocation = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print(AvailContacts)
    }
    
    /*
    func setupLocation(){
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }*/
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "messages"){
            let dest = segue.destination as! Messages
            dest.AvailContacts = AvailContacts
        }
        
    }
    
    @IBAction override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        if let source = unwindSegue.source as? Contacts{
            AvailContacts = source.AvailContacts
        }
    }


}

