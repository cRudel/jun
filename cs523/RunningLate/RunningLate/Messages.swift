//
//  Messages.swift
//  RunningLate
//
//  Created by Chris Rudel on 4/28/19.
//  Copyright © 2019 Chris Rudel. All rights reserved.
//

import Foundation
import UIKit
import MessageUI


class Messages: UIViewController{
    
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var txtField: UITextField!
    @IBAction func txtFieldUpdate(_ sender: Any) {
        let text = txtField.text ?? ""
        lblText.text = text
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
}
