//
//  Contacts.swift
//  RunningLate
//
//  Created by Chris Rudel on 4/10/19.
//  Copyright © 2019 Chris Rudel. All rights reserved.
//

struct Person{
    var name: String
    var phoneNumber: String
    var selected: Bool
}

import Foundation
import UIKit
import Contacts

class Contacts: UITableViewController{
    
    var AvailContacts: [Person] = []
    
    private func getContacts(){
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, err) in
            if let err = err {
                print("Failed to request access to contacts:", err)
                return
            }
            if granted{
                print("Access granted")
                
                let keys = [CNContactGivenNameKey,CNContactFamilyNameKey,CNContactPhoneNumbersKey]
                let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
                do{
                    try store.enumerateContacts(with: request, usingBlock:
                    {   (contact, stopEnumeration)  in
                        var name = ""
                        if(!contact.givenName.isEmpty){
                            name.append(contact.givenName + " ")
                        }
                        if(!contact.familyName.isEmpty){
                            name.append(contact.familyName)
                        }
                        
                        //print(type(of: contact.familyName))
                        
                        let phone:String = contact.phoneNumbers.first?.value.stringValue ?? ""
                        let dude = Person(name: name, phoneNumber: phone, selected: false)
                        self.AvailContacts.append(dude)
                        
                    })
                } catch let err{
                    print("failed to enumerate")
                    print(err)
                }

            }else{
                print("Access denied")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getContacts()
        //print(AvailContacts)
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AvailContacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = AvailContacts[indexPath.row].name
        return cell
    }

    
}
