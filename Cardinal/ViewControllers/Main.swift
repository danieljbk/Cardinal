///created by Daniel Kwon '22 & Stewart Zurbuch '21

import UIKit

//Stores the four numbers the user inputs in String form.
public var currentID: String = ""

//Communicate whether there is an ongoing sign-in. If so, true. If not, false.
var checkInStart:Bool = false

//Class for the general passcode system.
class Main: UIViewController {

    //This outlet represents the Confirm Button button.
    @IBOutlet weak var confirmButton: UIButton!
    
    //This outlet represents the Settings Button button.
    @IBOutlet weak var settingsButton: UIButton!
    
    //Displays the numbers the user inputs. Initially, their text is "__".
    @IBOutlet weak var numLabel1: UILabel!
    @IBOutlet weak var numLabel2: UILabel!
    @IBOutlet weak var numLabel3: UILabel!
    @IBOutlet weak var numLabel4: UILabel!
    
    //Displays a message if there is no ongoing sign-in.
    @IBOutlet weak var numLabelCenter: UILabel!

    //Hides the confirm button.
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.isEnabled = false
        confirmButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), for: .normal)
    }
    
    //When any of the numbers (not the confirm button or the delete button) are pressed, this action is executed.
    //  It updates the numLabels to display the user input.
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //If there is no ongoing sign-in, numLabeelCenter displays a message and the rest become blank.
        if checkInStart == false {
            numLabel1.text = ""
            numLabel2.text = ""
            numLabel3.text = ""
            numLabel4.text = ""
            numLabelCenter.text = "Begin Sign–In"
        }
        
        //If there is no ongoing sign-in, the following if statements do not run, as the numLabels' texts are not "__" anymore.
        //  If there is an ongoing sign-in, the numLabels and the currentID are updated.
        //      NOTE: one space was added to the numLabel text for design (width of number makes them shift slightly).
        if numLabel1.text == "__" {
            currentID = ""
            numLabel1.text = sender.titleLabel!.text! + " "
            currentID += sender.titleLabel!.text!
        }
        else if numLabel2.text == "__" {
            numLabel2.text = sender.titleLabel!.text! + " "
            currentID += sender.titleLabel!.text!
        }
        else if numLabel3.text == "__" {
            numLabel3.text = sender.titleLabel!.text! + " "
            currentID += sender.titleLabel!.text!
        }
        //If all four numLabels display a number, the confirm button is shown.
        else if numLabel4.text == "__" {
            numLabel4.text = sender.titleLabel!.text! + " "
            currentID += sender.titleLabel!.text!
            confirmButton.isEnabled = true
            confirmButton.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        }
        
        //This checks if the user input matches the secret passcode. Accordingly, it enables or disables the settings button.
        if numLabel1.text == "1 " && numLabel2.text == "9 " && numLabel3.text == "2 " && sender.titleLabel!.text == "9" {
                settingsButton.isEnabled = true
            confirmButton.isEnabled = false
            confirmButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), for: .normal)
        }
        else if checkInStart == false {
            settingsButton.isEnabled = true
            }
        else {
            settingsButton.isEnabled = false
            }
    }
    
    //When the settings button is pressed, this action is executed.
    //  This resets the numLabels.
    @IBAction func settingsButtonPressed(_ sender: Any) {
        numLabel1.text = "__"
        numLabel2.text = "__"
        numLabel3.text = "__"
        numLabel4.text = "__"
        numLabelCenter.text = "   "
    }
    
    //When the delete button is pressed, this action is executed.
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        //As there are only three numbers, the input is not the passcode. Therefore, it disables the settings button.
        settingsButton.isEnabled = false
        
        //This checks to see if there is an ongoing sign-in. If not, the settings button is enabled as the user must begin a new sign-in.
        if checkInStart == false {
            settingsButton.isEnabled = true
        }
        //This checks to see which of the numbers the user intends to delete and updates it accordingly along with the currentID.
        else {
            if numLabel4.text == "__" {
                if numLabel3.text == "__" {
                    if numLabel2.text == "__" {
                        if numLabel1.text != "__" {
                            numLabel1.text = "__"
                            currentID.removeLast()
                        }
                    }
                    else {
                        numLabel2.text = "__"
                        currentID.removeLast()
                    }
                }
                else {
                    numLabel3.text = "__"
                    currentID.removeLast()
                    }
            }
            else {
                numLabel4.text = "__"
                currentID.removeLast()
            }
        }
        
        //as there are no longer four numbers, a confirm button is not needed.
        confirmButton.isEnabled = false
        confirmButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), for: .normal)
    }
    
    //When the confirm button is pressed, this action is executed.
    @IBAction func confirmButtonPressed(_ sender: Any) {
        
        //This resets the numLabels.
        numLabel1.text = "__"
        numLabel2.text = "__"
        numLabel3.text = "__"
        numLabel4.text = "__"
        
        //This hides the confirm button.
        confirmButton.isEnabled = false
        confirmButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0), for: .normal)
    }
}
