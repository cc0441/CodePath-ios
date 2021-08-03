//
//  ViewController.swift
//  Prework
//
//  Created by cheng cheng on 7/29/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //billAmountTextField.becomeFirstResponder()
        
    
        
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let defaults = UserDefaults.standard
        let billAmountString = self.billAmountTextField.text?.replacingOccurrences(of: "$", with: "")
        let bill = Double(billAmountString!) ?? 0
        var tipPercentagesString = String(self.tipControl.titleForSegment(at: self.tipControl.selectedSegmentIndex)!) ?? ""
        tipPercentagesString = tipPercentagesString.replacingOccurrences(of: "%", with: "")
        let tipPercent=Double(tipPercentagesString) ?? 0
        
        let tip: Double = Double(bill * tipPercent/100)
        let total = bill + tip
        
        // Update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tipOne: String = defaults.object(forKey: "tipOne") as? String ?? ""
        let tipTwo: String = defaults.object(forKey: "tipTwo") as? String ?? ""
        let tipThree: String = defaults.object(forKey: "tipThree") as? String ?? ""
        if(tipOne != ""){
            self.tipControl.setTitle(tipOne, forSegmentAt: 0)
        }
        if(tipTwo != ""){
            self.tipControl.setTitle(tipTwo, forSegmentAt: 1)
        }
        if(tipThree != ""){
            self.tipControl.setTitle(tipThree, forSegmentAt: 2)
        }
        calculateTip(animated as AnyObject)
        
        
    }
    
    
}

