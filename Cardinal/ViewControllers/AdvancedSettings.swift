///created by Daniel Kwon '22 & Stewart Zurbuch '21

import UIKit

//This variable represents the JSON source. Initially, it is set to the JSON Source of St. Andrew's School Students.
var jsonUserInput:String = "https:socrates.standrews-de.org/api2/csdata.cfm"

//Class for the User to update the JSON Source.
class AdvancedSettings: UIViewController {

    //This text field is where the user can input their desired JSON Source.
    @IBOutlet weak var textField: UITextField!
    
    //When the view loads, the text field displays the current JSON Source.
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = jsonUserInput
    }
    
    //When the update button is pressed, this action is executed.
    @IBAction func updateJSON(_ sender: Any) {
        //The action sets the JSON Source as the text in the text field.
        jsonUserInput = textField.text!
        //The action dismisses the pop-up.
        dismiss(animated: true, completion: nil)
    }
}
