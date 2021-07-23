///created by Daniel Kwon '22 & Stewart Zurbuch '21

import UIKit

//This communicates whether at least one student signed in.
var firstStudentSignedIn:Bool = false

//In ConfirmSignIn, this variable is set to false when a new student signs in. This means that the student who last signed in has not been undoed.
var undoComplete = false

//This communicates whether all conditions are adequate for an Undo to take place.
var undoable = false

//Class for undoing a student.
class UndoSignIn: UIViewController {
    
    //This displays either the image of the student or the Cardinal logo if the student does not exist or has already been undoed.
    @IBOutlet weak var undoImage: UIImageView!
    
    //This displays the name of the student or the error message if the student has already been undoed or if there is no student to undo.
    @IBOutlet weak var nameLabel: UILabel!
    
    //When the view loads, this checks to see if all conditions are adequate for an undo to take place.
    override func viewDidLoad() {
        super.viewDidLoad()
        // If undoComplete is false, it means that the student has not been undoed already.
        // If studentDoesNotExist is false, it means that there is an actual student to undo.
        // If lastSignIn.count is greater than zero, it means that there is a student in the lastSignIn array that can be appended to studentArray.
        // If studentHasSignedIn is true, it means that the student has signed in, and therefore an undo is allowed.
        if undoComplete == false && studentDoesNotExist == false && lastSignIn.count > 0 && studentHasSignedIn == true {
            //Then, the image of undoImage is set to the image of the student.
            undoImage.image = newStudentData.retrieveImageFor(id:Int(lastSignIn[0].STUDENTNUMBER), forceReload: false)
            //Then, the text of the nameLabel is set to the first and last name of the student.
            nameLabel.text = "\(lastSignIn[0].STUDENTFIRSTNAME) \(lastSignIn[0].STUDENTLASTNAME)"
            //Then, var undoable is set to true, communicating to the confirmUndo action that when the confirm button is pressed, it is good to take the necessary steps to undo the student.
            undoable = true
        }
    }

    //When the confirm button is pressed, this action is executed.
    @IBAction func confirmUndo(_ sender: Any) {
        //if var undoable is true, the action appends the student back into studentArray and removes the student from the signedInStudents. This is the actual "undoing."
        //Then, the action removes the student from the lastSignIn array, sets var undoComplete to true, and sets studentHasSignedIn to false, completing the Undo process.
        if undoable {
            studentArray.append(lastSignIn[0])
            signedInStudents.removeLast()
            lastSignIn.remove(at: 0)
            undoComplete = true
            studentHasSignedIn = false
        }
        //Finally, the action sets var undoable to false, as the Undo has taken place and the app should not be able to undo another student until a new student has signed in.
        undoable = false
        //The action dismisses the pop-up.
        dismiss(animated: true, completion: nil)
    }
}
