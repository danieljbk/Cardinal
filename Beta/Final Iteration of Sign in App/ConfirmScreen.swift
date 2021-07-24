//
//  ConfirmScreen.swift
//  Final Iteration of Sign in App
//
//  Created by Stewart  Zurbuch on 12/15/19.
//  Copyright © 2019 Stewart  Zurbuch. All rights reserved.
//

import UIKit
var lastSignIn: [Student] = []
class ConfirmScreen: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        imageController.image = newStudentData.retrieveImageFor(id:Int(currentID)!, forceReload: false)
        nameLabel.text = (newStudentData.getStudentBy(id: Int(currentID)!)?.STUDENTFIRSTNAME ?? "Error:") + " " +  (newStudentData.getStudentBy(id: Int(currentID)!)?.STUDENTLASTNAME ?? "Already Signed In")
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageController: UIImageView!
    @IBAction func cancelPopover(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func confirmCheckIN(_ sender: Any) {
        var i = 0
        for s in newStudentData.students {
            if Int(s.STUDENTNUMBER) == Int(currentID) {
                if lastSignIn.count == 1 {
                    lastSignIn.remove(at: 0)
                }
                lastSignIn.append(s)
                currentStudentArray.remove(at: i)
            }
            i += 1
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
