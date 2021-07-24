import UIKit

public var formArray: [Double] = []
public var genderArray: [String] = []
class SignInSelection: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    var freshCheck: Bool = true
    var sophCheck: Bool = true
    var juniorCheck: Bool = true
    var seniorCheck: Bool = true
    var boyCheck: Bool = true
    var girlCheck: Bool = true

    
    @IBOutlet weak var freshmenButton: UIButton!
    
    @IBOutlet weak var sophomoreButton: UIButton!
    
    @IBOutlet weak var juniorButton: UIButton!
    
    @IBOutlet weak var seniorButton: UIButton!
    
    @IBOutlet weak var boyButton: UIButton!
    
    @IBOutlet weak var girlButton: UIButton!
    
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
    @IBAction func breakfastCheckInConfirm(_ sender: Any) {
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
        dismiss(animated: true, completion: nil)
    }
}
