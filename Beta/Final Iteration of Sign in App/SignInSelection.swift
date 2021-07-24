//
//  SignInSelection.swift
//  Final Iteration of Sign in App
//
//  Created by Stewart  Zurbuch on 12/16/19.
//  Copyright © 2019 Stewart  Zurbuch. All rights reserved.
//

import UIKit
public var formArray: [Double] = []
public var genderArray: [String] = []
class SignInSelection: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    var freshCheck: Bool = false
    var sophCheck: Bool = false
    var juniorCheck: Bool = false
    var seniorCheck: Bool = false
    var boyCheck: Bool = false
    var girlCheck: Bool = false
    @IBAction func freshButtonPressed(_ sender: Any) {
        if !freshCheck{
            freshCheck = true
        }
        
    }
    @IBAction func sophButtonPressed(_ sender: Any) {
        if !sophCheck{
            sophCheck = true
        }
    }
    @IBAction func juniorButtonPressed(_ sender: Any) {
        if !juniorCheck{
            juniorCheck = true
        }
    }
    @IBAction func seniorButtonPressed(_ sender: Any) {
        if !seniorCheck{
            seniorCheck = true
        }
    }
    @IBAction func boyButtonPressed(_ sender: Any) {
        if !boyCheck{
            boyCheck = true
        }
    }
    @IBAction func girlButtonPressed(_ sender: Any) {
        if !girlCheck{
            girlCheck = true
        }
        
    }
    @IBAction func breakfastCheckInConfirm(_ sender: Any) {
        if freshCheck {
            formArray.append(3.0)
        }
        if sophCheck {
            formArray.append(4.0)
        }
        if juniorCheck {
            formArray.append(5.0)
        }
        if seniorCheck {
            formArray.append(6.0)
        }
        if boyCheck {
            genderArray.append("M")
        }
        if girlCheck {
            genderArray.append("F")
        }
        dismiss(animated: true, completion: nil)
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
