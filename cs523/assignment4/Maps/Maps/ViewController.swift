//
//  ViewController.swift
//  Maps
//
//  Created by Chris Rudel on 3/3/19.
//  Copyright © 2019 Chris Rudel. All rights reserved.
//

/* --- Coordinate info ----
 Stevens: 40.7442912, -74.0260221
 NYC: 40.7216294, -73.995453
 */

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var coordinate2D = CLLocationCoordinate2DMake(40.7442912, -74.0260221)
    var isOn = false
    /*
    let bennysPin = PinAnnotation(coordinate: <#T##CLLocationCoordinate2D#>, title: <#T##String?#>, subtitle: <#T##String?#>)
    let stevensPin = PinAnnotation(coordinate: <#T##CLLocationCoordinate2D#>, title: <#T##String?#>, subtitle: <#T##String?#>)
    let stevensParkPin = PinAnnotation(coordinate: <#T##CLLocationCoordinate2D#>, title: <#T##String?#>, subtitle: <#T##String?#>)
    let carlosPin = PinAnnotation(coordinate: <#T##CLLocationCoordinate2D#>, title: <#T##String?#>, subtitle: <#T##String?#>)
    let libraryPin = PinAnnotation(coordinate: <#T##CLLocationCoordinate2D#>, title: <#T##String?#>, subtitle: <#T##String?#>)
    let policePin = PinAnnotation(coordinate: <#T##CLLocationCoordinate2D#>, title: <#T##String?#>, subtitle: <#T##String?#>)
    let hospitalPin = PinAnnotation(coordinate: <#T##CLLocationCoordinate2D#>, title: <#T##String?#>, subtitle: <#T##String?#>)
    let biergartenPin = PinAnnotation(coordinate: <#T##CLLocationCoordinate2D#>, title: <#T##String?#>, subtitle: <#T##String?#>)
    let obagelPin = PinAnnotation(coordinate: <#T##CLLocationCoordinate2D#>, title: <#T##String?#>, subtitle: <#T##String?#>)
    let trainPin = PinAnnotation(coordinate: <#T##CLLocationCoordinate2D#>, title: <#T##String?#>, subtitle: <#T##String?#>)
    */
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func standardBtn(_ sender: Any) {
        mapView.mapType = MKMapType.standard
    }
    @IBAction func satelliteBtn(_ sender: Any) {
        mapView.mapType = MKMapType.satellite
    }
    @IBAction func hybridBtn(_ sender: Any) {
        mapView.mapType = MKMapType.hybrid
    }
    
    @IBAction func toggleMapFeatures(_ sender: Any) {
        mapView.showsBuildings = isOn
        isOn = !isOn
    }
    @IBAction func zoomBtn(_ sender: Any) {
        var region = mapView.region
        region.span.latitudeDelta /= 2.0
        region.span.longitudeDelta /= 2.0
        mapView.setRegion(region, animated: true)
    }
    @IBAction func zoomOutBtn(_ sender: Any) {
        var region = mapView.region
        region.span.latitudeDelta *= 2.0
        region.span.longitudeDelta *= 2.0
        mapView.setRegion(region, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMapRegion(rangeSpan: 1500)
    }

    
    func updateMapRegion(rangeSpan: CLLocationDistance){
        let region = MKCoordinateRegion(center: coordinate2D, latitudinalMeters: rangeSpan, longitudinalMeters: rangeSpan)
        mapView.region = region
    }
    
    

}

