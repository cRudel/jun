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
import MessageUI

class Main: UIViewController, CLLocationManagerDelegate, MFMessageComposeViewControllerDelegate {
    
    var HomeLocation: MKPointAnnotation?
    var AvailContacts: [Person]?
    var MessageToSend: String = "Hello, I am running late today I apologize for the inconvience!"
    var AlarmDays = [Weekday(day: "Sunday", enabled: false), Weekday(day: "Monday", enabled: true), Weekday(day: "Tuesday", enabled: true), Weekday(day: "Wednesday", enabled: true), Weekday(day: "Thursday", enabled: true), Weekday(day: "Friday", enabled: true), Weekday(day: "Saturday", enabled: false)]
    var AlarmTime:String = "9:00 AM"
    
    
    
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
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
        print(AlarmTime)
        /* What the code below does is create a timer that checks every minute if
           the day is correct and if the time is correct. It takes this timer
           and adds it to the runloop so it constantly runs*/
        let checkLateTimer = Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: #selector(checkIfAlarm), userInfo: nil, repeats: true)
        RunLoop.main.add(checkLateTimer, forMode: .common)
        //print(AvailContacts ?? "no c")
        //print(MessageToSend)
    }
    @objc func checkIfAlarm(){
        print("minute passed")
        if(compareAlarmToDay()){
            print("Correct day")
            let date = Date().description(with: .current)
            var strs = date.description.components(separatedBy: " ")
            var currentTime = strs[5]
            currentTime.removeLast(3)
            currentTime += " "
            currentTime += strs[6]
            print(currentTime)
            if(currentTime == AlarmTime){
                let location = manager.location!
                let currentLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                if(currentLocation.latitude == HomeLocation!.coordinate.latitude && currentLocation.longitude == HomeLocation!.coordinate.longitude){
                    print("locations are the same")
                    let messageVC = MFMessageComposeViewController()
                    messageVC.body = MessageToSend
                    var phoneNumbers: [String] = []
                    for person in AvailContacts!{
                        if(person.selected){
                            phoneNumbers.append(person.phoneNumber)
                        }
                    }
                    if(!phoneNumbers.isEmpty){
                        print(phoneNumbers)
                        messageVC.recipients = phoneNumbers
                        messageVC.messageComposeDelegate = self
                        if(canSendText()){
                            self.present(messageVC, animated: true, completion: nil)
                        }
                    }
                }else{
                    print("locations are different")
                }
            }
        }
    }
    
    func canSendText() -> Bool{
        return MFMessageComposeViewController.canSendText()
    }
    func compareAlarmToDay() -> Bool{
        let date = Date().description(with: .current)
        //print(date)
        let currentDay = date.description.components(separatedBy: ",").first ?? ""
        var returnMe = false
        for days in AlarmDays{
            if(days.day == currentDay){
                returnMe = days.enabled
            }
        }
        return returnMe
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "messages"){
            let dest = segue.destination as! Messages
            dest.msg = MessageToSend
            if let contacts = AvailContacts{
                dest.AvailContacts = contacts
            }
        }
        if(segue.identifier == "contacts"){
            //print("transitioning to contacts")
            let dest = segue.destination as! Contacts
            if let contacts = AvailContacts{
                dest.AvailContacts = contacts
            }
        }
        
        if(segue.identifier == "calendar"){
            let dest = segue.destination as! Calendar
            dest.days = AlarmDays
            dest.timeOfAlarm = AlarmTime
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch(result){
        case .cancelled:
            print("The message was cancelled")
            dismiss(animated: true, completion: nil)
        case .failed:
            print("The message failed")
            dismiss(animated: true, completion: nil)
        case .sent:
            print("Hurray the message was sent")
            dismiss(animated: true, completion: nil)
            
        default:
            break
        
        }
    }


}

