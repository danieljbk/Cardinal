import UIKit

var jsonUserInput:String = "https:socrates.standrews-de.org/api2/csdata.cfm"

class advancedSettings: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = jsonUserInput
    }
    @IBOutlet weak var textField: UITextField!
    @IBAction func updateJSONConfirm(_ sender: Any) {
        jsonUserInput = textField.text!
        
        dismiss(animated: true, completion: nil)
    }
}
