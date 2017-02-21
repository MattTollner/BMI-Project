//
//  ViewController.swift
//  BMI
//
//  Created by LinuxPlus on 2/20/17.
//  Copyright © 2017 LinuxPlus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    var weight : Double?
    var height : Double?
    //Computed property
    var bmi : Double? {
        get {
            if(weight != nil) && (height != nil){
                return weight! / (height! * height!)
            } else {
                return nil
            }
        }
    }
    
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
    
    func updateUI(){
        if let b = self.bmi{
            //update UI with calculated bmi (b)
            self.bmiLabel.text = String(format: "%4.1f",b)
        }
    }
    //textrFiled refernece to which is being edited
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //If nill it will fail and return
        guard let txt  : String = textField.text else {
            return
        }
        
        //This point txt is unwrapped and string
        func conv(numString : String) -> Double?{
        
            let result : Double? = NumberFormatter().number(from: numString)?.doubleValue
            return result
            
        }
        
        
        switch (textField) {
            
        case heightTxtField:
            self.height = conv(numString: txt)
            
        case weightTxtField:
            self.weight = conv(numString: txt)
            
        default:
            print("Somethign bad happened")
        } //End of switch
        
        updateUI()
        
    }


    
}

