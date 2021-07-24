//
//  sendEmail.swift
//  Final Iteration of Sign in App
//
//  Created by Stewart  Zurbuch on 12/17/19.
//  Copyright © 2019 Stewart  Zurbuch. All rights reserved.
//

import UIKit
import MessageUI
class sendEmail: UIViewController, MFMailComposeViewControllerDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBAction func sendData(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            var listOfStudents: String = ""
            for s in newStudentData.students {
                if formArray.contains(s.STUDENTFORM) {
                    if genderArray.contains(s.STUDENTSEX) {
                        listOfStudents += "\(s.STUDENTFIRSTNAME) \(s.STUDENTLASTNAME) \n"
                    }
                }
            }
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["\(emailTextField.text!)@standrews-de.org"])
            mail.setMessageBody(listOfStudents, isHTML: true)
            present(mail, animated: true)
            if !errorLabel.isHidden {
                errorLabel.isHidden = true
            }
        } else {
            errorLabel.isHidden = false
        }
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
