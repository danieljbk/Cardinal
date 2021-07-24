//
//  advancedSettings.swift
//  Final Iteration of Sign in App
//
//  Created by Stewart  Zurbuch on 12/17/19.
//  Copyright © 2019 Stewart  Zurbuch. All rights reserved.
//

import UIKit

class advancedSettings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var textField: UITextField!
    @IBAction func updateJSONConfirm(_ sender: Any) {
        jsonFile = textField.text ?? "https://socrates.standrews-de.org/api2/csdata.cfm"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
