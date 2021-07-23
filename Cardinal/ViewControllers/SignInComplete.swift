///created by Daniel Kwon '22

import UIKit

//Class for reseting the contents of arrays, preparing the app for a new sign-in.
class SignInComplete: UIViewController {
    
    //Nothing to do initially.
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //disables Swipe down to dismiss
    override func viewWillLayoutSubviews() {
        isModalInPresentation = true
    }

    //When the done button is pressed, this action is executed.
    @IBAction func donePressed(_ sender: Any) {

        //The action resets the values of properties to their original states.
        currentID = ""
        finalAllStudentsList = []
        formArray = []
        genderArray = []
        signedInStudents = []
        lastSignIn = []
        finalFreshmenList = []
        finalSophomoreList = []
        finalJuniorList = []
        finalSeniorList = []
        
        studentHasSignedIn = false
        checkInStart = false
        firstStudentSignedIn = false
        undoComplete = false
        undoable = false

        //Then, it resets the studentArray to include all students, communicating a status where no student has signed in and preparing them for a new sign-in.
        studentArray = newStudentData.students
        
        //The action dismisses the pop-up.
        dismiss(animated: true, completion: nil)
    }
}
