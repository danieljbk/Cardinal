///created by Daniel Kwon '22 & Stewart Zurbuch '21

import UIKit

//Communicates which forms the user wants to check. This data is utilized in FinalStudentList.swift.
public var formArray: [Double] = []

//Communicates which genders the user wants to check. This data is utilized in FinalStudentList.swift.
public var genderArray: [String] = []

//Class for checking which forms and genders the user wants to check in the sign-in.
class FormAndGender: UIViewController {

    //This outlet represents the Freshmen Button button.
    @IBOutlet weak var freshmenButton: UIButton!
    
    //This outlet represents the Sophomore Button button.
    @IBOutlet weak var sophomoreButton: UIButton!
    
    //This outlet represents the Junior Button button.
    @IBOutlet weak var juniorButton: UIButton!
    
    //This outlet represents the Senior Button button.
    @IBOutlet weak var seniorButton: UIButton!
    
    //This outlet represents the Boy Button button.
    @IBOutlet weak var boyButton: UIButton!
    
    //This outlet represents the Girl Button button.
    @IBOutlet weak var girlButton: UIButton!
    
    //Nothing to do initially.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Disables Swipe down to dismiss
    override func viewWillLayoutSubviews() {
        isModalInPresentation = true
    }
    
    //These variables communicate whether the user desires to check a specific gender or form.
    var freshCheck: Bool = true
    var sophCheck: Bool = true
    var juniorCheck: Bool = true
    var seniorCheck: Bool = true
    var boyCheck: Bool = true
    var girlCheck: Bool = true

    //When the III button is pressed, this action is executed.
    //  If var freshCheck is false, it sets it to true and changes the button's color to Cardinal Red.
    //  If var freshCheck is true, it sets it to false and changes the button's color to grey.
    @IBAction func freshButtonPressed(_ sender: Any) {
        if !freshCheck {
            freshCheck = true
            freshmenButton.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        }
        else if freshCheck {
            freshCheck = false
            freshmenButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
    }
    
    //Similar, but for the IV button and var sophCheck.
    @IBAction func sophButtonPressed(_ sender: Any) {
        if !sophCheck{
            sophCheck = true
            sophomoreButton.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        }
        else if sophCheck == true {
            sophCheck = false
            sophomoreButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
    }
    
    //Similar, but for the V button and var juniorCheck.
    @IBAction func juniorButtonPressed(_ sender: Any) {
        if !juniorCheck{
            juniorCheck = true
            juniorButton.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        }
        else if juniorCheck == true {
            juniorCheck = false
            juniorButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
    }
    
    //Similar, but for the VI button and var seniorCheck.
    @IBAction func seniorButtonPressed(_ sender: Any) {
        if !seniorCheck{
            seniorCheck = true
            seniorButton.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        }

        else if seniorCheck == true {
            seniorCheck = false
            seniorButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
    }

    //Similar, but for the Boys button and var boyCheck.
    @IBAction func boyButtonPressed(_ sender: Any) {
        if !boyCheck{
            boyCheck = true
            boyButton.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        }
        else if boyCheck == true {
            boyCheck = false
            boyButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
    }
    
    //Similar, but for the Girls button and var girlCheck.
    @IBAction func girlButtonPressed(_ sender: Any) {
        if !girlCheck{
            girlCheck = true
            girlButton.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        }
        else if girlCheck == true {
            girlCheck = false
            girlButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        }
        
    }
    
    //When the confirm button is pressed, this action is executed.
    //  This action checks which forms and genders the user desired and appends information accordingly to the formArray and genderArray.
    @IBAction func formAndGenderConfirm(_ sender: Any) {
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
        //The action dismisses the pop-up.
        dismiss(animated: true, completion: nil)
    }
}
