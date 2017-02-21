//
//  ViewController.swift
//  BMI
//
//  Created by LinuxPlus on 2/20/17.
//  Copyright © 2017 LinuxPlus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var heightTxtField: UITextField!
    @IBOutlet weak var weightTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()        
        return true
    }


    
}

