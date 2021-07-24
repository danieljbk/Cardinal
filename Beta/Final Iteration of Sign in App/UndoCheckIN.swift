//
//  UndoCheckIN.swift
//  Final Iteration of Sign in App
//
//  Created by Stewart  Zurbuch on 12/17/19.
//  Copyright © 2019 Stewart  Zurbuch. All rights reserved.
//

import UIKit

class UndoCheckIN: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        undoImage.image = newStudentData.retrieveImageFor(id:Int(lastSignIn[0].STUDENTNUMBER), forceReload: false)
        nameLabel.text = "\(lastSignIn[0].STUDENTFIRSTNAME) \(lastSignIn[0].STUDENTLASTNAME)"
    }
    
    @IBOutlet weak var undoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBAction func confirmUndo(_ sender: Any) {
        currentStudentArray.append(lastSignIn[0])
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
