import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if checkInStart == false {
        completeCheckIn.setTitleColor(#colorLiteral(red: 0.937254902, green: 0.9254901961, blue: 0.8980392157, alpha: 0), for: .normal)
        undoLastCheckIn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
        completeCheckIn.isHidden = true
        beginCheckIN.isHidden = false
        undoLastCheckIn.isHidden = true
        advancedSettings.isHidden = false
        }
        if checkInStart == true {
        beginCheckIN.setTitleColor(#colorLiteral(red: 0.937254902, green: 0.9254901961, blue: 0.8980392157, alpha: 0), for: .normal)
        advancedSettings.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
        completeCheckIn.isHidden = false
        beginCheckIN.isHidden = true
        undoLastCheckIn.isHidden = false
        advancedSettings.isHidden = true
        }
    }
    @IBOutlet weak var completeCheckIn: UIButton!
    
    @IBOutlet weak var beginCheckIN: UIButton!
    
    @IBOutlet weak var advancedSettings: UIButton!
    
    @IBOutlet weak var undoLastCheckIn: UIButton!
    
    @IBAction func beginButtonPressed(_ sender: Any) {
        checkInStart = true
        beginCheckIN.isHidden = true
        completeCheckIn.isHidden = false
        
        beginCheckIN.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
        completeCheckIn.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        //sets middle two buttons
        
        advancedSettings.isHidden = true
        undoLastCheckIn.isHidden = false
        
        advancedSettings.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
        undoLastCheckIn.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        //sets bottom two buttons
    }
    
    @IBAction func completeButtonPressed(_ sender: Any) {
        checkInStart = false
        completeCheckIn.isHidden = true
        beginCheckIN.isHidden = false
        
        completeCheckIn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
        beginCheckIN.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        //sets middle two buttons
        
        undoLastCheckIn.isHidden = true
        advancedSettings.isHidden = false
        
        undoLastCheckIn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0), for: .normal)
        advancedSettings.setTitleColor(#colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1), for: .normal)
        //sets bottom two buttons
    }
}

