///created by Daniel Kwon '22 & Stewart Zurbuch '21

import UIKit

// Struct to hold individual student records.
//  Property names must match JSON.
struct Student:Codable {
    var STUDENTNUMBER:Double
    var STUDENTFIRSTNAME:String
    var STUDENTLASTNAME:String
    var STUDENTSEX:String
    var STUDENTFORM:Double
    var STUDENTDORM:String
}

//Stores the data for accessing student data. Originally declared in StudentData.swift. However, an error appears if not declared in ConfirmSignIn.swift.
var newStudentData = StudentData()

//holds all students.
var studentArray: [Student] = newStudentData.students

//holds the last student who attempted to sign-in.
var lastSignIn: [Student] = []

//holds all students who signed in.
var signedInStudents: [Student] = []

//communicates if the student attempting to sign-in has already signed-in.
var studentHasSignedIn: Bool = false

//Class for loading the student's image and "signing" them in.
class ConfirmSignIn: UIViewController {
    
    //This normally displays the name of the student. However, it will display other error messages based on circumstance.
    @IBOutlet weak var nameLabel: UILabel!
    
    //This displays the image of the student, or it displays the St. Andrew's crest if the student does not exist.
    @IBOutlet weak var imageController: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Loads the image using the currentID.
        imageController.image = newStudentData.retrieveImageFor(id:Int(currentID)!, forceReload: false)
        //If the currentID does not match with a student in the database, the nameLabel displays the message that the student does not exist.
        nameLabel.text = (newStudentData.getStudentBy(id: Int(currentID)!)?.STUDENTFIRSTNAME ?? "") + " " +  (newStudentData.getStudentBy(id: Int(currentID)!)?.STUDENTLASTNAME ?? "Student Does Not Exist!")
        //The for loop checks the data of all students, signed in or not, to identify the student attempting to sign-in.
        //  Then, it checks to see if the student matched with the currentID is in the signedInStudents array.
        //  If so, the nameLabel displays the message that the student has already signed in.
        //  Then, in case the student signing in is attempting to undo their sign-in, this resets the lastSignIn array and then appends the student.
        //  It also sets var studentHasSignedIn to true, meaning that the student who is attempting to sign-in has already signed in.
        for current in newStudentData.students {
            if Int(current.STUDENTNUMBER) == Int(currentID) {
                for previous in signedInStudents {
                    if previous.STUDENTNUMBER == current.STUDENTNUMBER {
                        lastSignIn = []
                        lastSignIn.append(current)
                        nameLabel.text = "Already Signed In!"
                        studentHasSignedIn = true
                    }
                }
            }
        }
        //This checks to see if the student attempting to sign in is an entity in the studentArray.
        //  The studentArray only contains the students who have not signed in.
        //  Therefore, if the student exists in the studentArray, the student has not signed in. It sets studentHasSignedIn to false.
        for student in studentArray {
            if Int(student.STUDENTNUMBER) == Int(currentID) {
                studentHasSignedIn = false
            }
        }
    }
    
    //When the confirm button is pressed, this action is executed.
    @IBAction func confirmSignIn(_ sender: Any) {
        //if the student has already signed in, this action sets undoComplete to false, allowing the student to Undo themselves if desired.
        if studentHasSignedIn == true {
            undoComplete = false
            //The action dismisses the pop-up.
            dismiss(animated: true, completion: nil)
            return
        }
        //If the student is newly signing in, that means that the student is an entity in studentArray. Therefore, the for loop only checks the studentArray and not the entire student database.
        //  Then, the action appends the student to the signedInStudents array.
        //  Then, it clears the lastSignIn array and appends the current student to it.
        //  Then, it removes the student from the studentArray.
        //  The studentArray is used to display the FinalStudentList, so this represents the action of signing in.
        else {
            var place = 0
            for current in studentArray {
                if Int(current.STUDENTNUMBER) == Int(currentID) {
                    signedInStudents.append(current)
                    lastSignIn.removeAll()
                    lastSignIn.append(current)
                    studentArray.remove(at: place)
                }
            place += 1
            }
            //These variables are used in UndoSignIn.swift to confirm that the student being undoed has not been undoed before.
            undoComplete = false
            studentHasSignedIn = true
        }
        //The action dismisses the pop-up.
        dismiss(animated: true, completion: nil)
    }
}
