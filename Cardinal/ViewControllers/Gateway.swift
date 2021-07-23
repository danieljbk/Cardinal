///created by Daniel Kwon '22

import UIKit

//Class for the four buttons in the Gateway viewController.
class Gateway: UIViewController {

    //This outlet represents the End Sign In button.
    @IBOutlet weak var endSignIn: UIButton!
    
    //This outlet represents the Begin Sign In button.
    @IBOutlet weak var beginSignIn: UIButton!
    
    //This outlet represents the Advanced Settings button.
    @IBOutlet weak var advancedSettings: UIButton!
    
    //This outlet represents the Undo Last Student button.
    @IBOutlet weak var undoLastStudent: UIButton!
    
    //There are two states for this viewController. One is when there is an ongoing sign-in, and one is when there is not.
    override func viewDidLoad() {
        super.viewDidLoad()
        //if there is no ongoing sign-in, beginSignIn and advancedSettings are shown while endSignIn and undoLastStudent are hidden.
        if checkInStart == false {
            endSignIn.setTitleColor(#colorLiteral(red: 0.937254902, green: 0.9254901961, blue: 0.8980392157, alpha: 0), for: .normal)
            undoLastStudent.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
            endSignIn.isHidden = true
            beginSignIn.isHidden = false
            undoLastStudent.isHidden = true
            advancedSettings.isHidden = false
        }
        //if there is an ongoing sign-in, the opposite is done.
        if checkInStart == true {
            beginSignIn.setTitleColor(#colorLiteral(red: 0.937254902, green: 0.9254901961, blue: 0.8980392157, alpha: 0), for: .normal)
            advancedSettings.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
            endSignIn.isHidden = false
            beginSignIn.isHidden = true
            undoLastStudent.isHidden = false
            advancedSettings.isHidden = true
        }
    }
    
    //When the beginSignIn button is pressed, this action is executed.
    //  This sets bool checkInStart to true, meaning that there is an ongoig sign-in.
    //  This hides beginSignIn and advancedSettings while showing endSignIn and undoLastStudent.
    @IBAction func beginButtonPressed(_ sender: Any) {
        checkInStart = true
        beginSignIn.isHidden = true
        endSignIn.isHidden = false
        
        beginSignIn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
        endSignIn.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        
        advancedSettings.isHidden = true
        undoLastStudent.isHidden = false
        
        advancedSettings.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
        undoLastStudent.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
    }
    //When the endSignIn button is pressed, this action is executed.
    //  This action does the opposite of beginButtonPressed.
    @IBAction func endButtonPressed(_ sender: Any) {
        checkInStart = false
        endSignIn.isHidden = true
        beginSignIn.isHidden = false
        
        endSignIn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
        beginSignIn.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        
        undoLastStudent.isHidden = true
        advancedSettings.isHidden = false
        
        undoLastStudent.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
        advancedSettings.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
    }
}

