//
//  Calendar.swift
//  RunningLate
//
//  Created by Chris Rudel on 4/30/19.
//  Copyright © 2019 Chris Rudel. All rights reserved.
//

import UIKit

class Calendar: UIViewController {
    
    var days = [Weekday(day: "Sunday", enabled: false), Weekday(day: "Monday", enabled: true), Weekday(day: "Tuesday", enabled: true), Weekday(day: "Wednesday", enabled: true), Weekday(day: "Thursday", enabled: true), Weekday(day: "Friday", enabled: true), Weekday(day: "Saturday", enabled: false)]
    
    @IBAction func switchToggle(_ sender: Any) {
        let tag = (sender as AnyObject).tag!
        days[tag].enabled = !days[tag].enabled
        print(days)
    }
    

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
}
