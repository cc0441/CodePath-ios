//
//  SettingViewController.swift
//  Prework
//
//  Created by cheng cheng on 8/1/21.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var tipOne: UILabel!
    @IBOutlet weak var tipOneTextField: UITextField!
    @IBOutlet weak var tipTwo: UILabel!
    @IBOutlet weak var tipTwoTextField: UITextField!
    @IBOutlet weak var tipThree: UILabel!
    @IBOutlet weak var tipThreeTextField: UITextField!
    @IBOutlet weak var darkMode: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func tipOneChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        var tipOneText: String = tipOneTextField.text!
        tipOneText = tipOneText.replacingOccurrences(of: "%", with: "")
        defaults.set(tipOneText+"%", forKey: "tipOne")
        defaults.synchronize()
    }
    
    
    @IBAction func tipTwoChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        var tipTwoText: String = tipTwoTextField.text!
        tipTwoText = tipTwoText.replacingOccurrences(of: "%", with: "")
        defaults.set(tipTwoText+"%", forKey: "tipTwo")
        defaults.synchronize()
    }
    
    @IBAction func tipThreeChange(_ sender: Any) {
        let defaults = UserDefaults.standard
        var tipThreeText: String = tipThreeTextField.text!
        tipThreeText = tipThreeText.replacingOccurrences(of: "%", with: "")
        defaults.set(tipThreeText+"%", forKey: "tipThree")
        defaults.synchronize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tipOne: String = defaults.object(forKey: "tipOne") as? String ?? ""
        let tipTwo: String = defaults.object(forKey: "tipTwo") as? String ?? ""
        let tipThree: String = defaults.object(forKey: "tipThree") as? String ?? ""
        if(tipOne != ""){
            self.tipOneTextField.text = tipOne
        }
        if(tipTwo != ""){
            self.tipTwoTextField.text = tipTwo
        }
        if(tipThree != ""){
            self.tipThreeTextField.text = tipThree
        }
        defaults.synchronize()
    }
    
    func checkSwitchState(){
        let userDefaults = UserDefaults.standard
        if(userDefaults.bool(forKey: "onOff")){
            darkModeSwitch.setOn(true, animated: false)
        }else{
            darkModeSwitch.setOn(false, animated: false)
        }
    }
    
    @IBAction func darkModeChange(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        if(darkModeSwitch.isOn){
            userDefaults.set(true, forKey: "onOff")
            view.backgroundColor = UIColor.gray
        }else{
            userDefaults.set(false, forKey: "onOff")
            view.backgroundColor = UIColor.white
        }
        
    }
    

}
