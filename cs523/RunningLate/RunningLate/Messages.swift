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
    
    var AvailContacts: [Person] = []
    
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var txtField: UITextField!
    @IBAction func txtFieldUpdate(_ sender: Any) {
        let text = txtField.text ?? ""
        lblText.text = text
    }
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
        print(AvailContacts)
    }
    
}
extension Messages: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        for contact in AvailContacts{
            if(contact.selected){
                count += 1
            }
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        if(AvailContacts[indexPath.row].selected){
            cell.textLabel!.text = AvailContacts[indexPath.row].name
        }
        return cell
    }
    
}
