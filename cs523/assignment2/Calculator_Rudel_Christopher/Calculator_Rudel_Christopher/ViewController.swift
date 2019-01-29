//
//  ViewController.swift
//  Calculator_Rudel_Christopher
//
//  Created by Chris Rudel on 1/29/19.
//  Copyright © 2019 Chris Rudel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstNumber = ""
    var secondNumber = ""
    var operand = ""
    var result:String = ""
    
    @IBOutlet weak var myOutputLabel: UILabel!
    
    
    @IBAction func myZero(_ sender: Any) {
        
    }
    @IBAction func myOne(_ sender: Any) {
        myOutputLabel.text = "TODO: finish this up"
    }
    @IBAction func myTwo(_ sender: Any) {
        
    }
    @IBAction func myThree(_ sender: Any) {
        
    }
    @IBAction func myFour(_ sender: Any) {
        
    }
    @IBAction func myFive(_ sender: Any) {
        
    }
    @IBAction func mySix(_ sender: Any) {
        
    }
    @IBAction func mySeven(_ sender: Any) {
        
    }
    @IBAction func myEight(_ sender: Any) {
        
    }
    @IBAction func myNine(_ sender: Any) {
        
    }
    
    @IBAction func myEquals(_ sender: Any) {
        
    }
    
    @IBAction func myClear(_ sender: Any) {
        myOutputLabel.text = ""
        result = ""
        firstNumber = ""
        secondNumber = ""
        operand = ""
        result = ""
    }
    
    @IBAction func myAddition(_ sender: Any) {
    }
    @IBAction func mySubtraction(_ sender: Any) {
    }
    @IBAction func myDivision(_ sender: Any) {
    }
    @IBAction func myMultiplication(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

