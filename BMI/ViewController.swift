//
//  ViewController.swift
//  BMI
//
//  Created by LinuxPlus on 2/20/17.
//  Copyright © 2017 LinuxPlus. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    class func doDiv100(u: Int) -> Double{
        return Double(u) * 0.01
    }
    
    class func doDiv2(u: Int) -> Double{
        return Double(u) * 0.5
    }
    
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
    
    //Picker values
    let listOfHeightsInM = Array(140...220).map(ViewController.doDiv100)
    let listOfWeightInKG = Array(80...240).map(ViewController.doDiv2)
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var heightTxtField: UITextField!
    @IBOutlet weak var weightTxtField: UITextField!
    @IBOutlet weak var heightPickerView: UIPickerView!
    @IBOutlet weak var weightPickerView: UIPickerView!
    
    
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView {
        case heightPickerView:
            return self.listOfHeightsInM.count
        case weightPickerView:
            return self.listOfWeightInKG.count
        default:
            return 1
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case heightPickerView:
            return String(format: "%4.2f", self.listOfHeightsInM[row])
        case weightPickerView:
            return String(format: "%4.2f", self.listOfWeightInKG[row])
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case heightPickerView:
            self.height = self.listOfHeightsInM[row]
        case weightPickerView:
            self.weight = self.listOfWeightInKG[row]
        default:
            break
        }
        updateUI()
    }


    
}

