///created by Daniel Kwon '22 & Dustin Fang '20

import UIKit

//This array stores all students who did not sign-in.
var finalAllStudentsList = [Student]()

//These arrays separate the students who did not sign-in by form.
var finalFreshmenList = [Student]()
var finalSophomoreList = [Student]()
var finalJuniorList = [Student]()
var finalSeniorList = [Student]()

//Class for displaying the students who did not sign-in in a list.
class FinalStudentList: UITableViewController {
    
    //When the view loads, this filters the studentArray and adds only the students with the form and gender property the user selected to the finalAllStudentsList Array.
    override func viewDidLoad() {
        super.viewDidLoad()
        for s in studentArray {
            if formArray.contains(s.STUDENTFORM) {
                if genderArray.contains(s.STUDENTSEX) {
                    finalAllStudentsList.insert(s, at: 0)
                }
            }
        }
        //For use in future versions, these statements separate the final list of students into different forms. For the current app, these array and these lines of code do not have any purpose.
        for s in finalAllStudentsList {
            if s.STUDENTFORM == 3.0 {
                    finalFreshmenList.append(s)
            }
            if s.STUDENTFORM == 4.0 {
                    finalSophomoreList.append(s)
            }
            if s.STUDENTFORM == 5.0 {
                    finalJuniorList.append(s)
            }
            if s.STUDENTFORM == 6.0 {
                    finalSeniorList.append(s)
            }
        }
    }

    //This function sets number of cells. It is set to the number of students in finalAllStudentsList.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalAllStudentsList.count
    }
    
    //This function adds the cells to the tableView and edits the designs of the cells.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        //This line of code connects to the TableView cell in the viewController.
        //  NOTE: The identifier name must match the identifier put into the cells in the storyboard (withIdentifier: "students").
        let cell = tableView.dequeueReusableCell(withIdentifier: "students", for: indexPath)
        
        //This sets the text of the cell to the student's first and last name. This process is repeated for all cells.
        cell.textLabel?.text = finalAllStudentsList[indexPath.item].STUDENTFIRSTNAME + " " + finalAllStudentsList[indexPath.item].STUDENTLASTNAME
        
        //These lines of code set the visual properties of the cell.
        cell.textLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 15)
        cell.textLabel?.textColor = #colorLiteral(red: 0.6752108932, green: 0.1266627014, blue: 0.1960295141, alpha: 1)
        cell.textLabel?.textAlignment = NSTextAlignment.center

    //if you would like the image of the person to show up next to their name, uncomment this line of code.
    //  NOTE: This will cause significant lag.
///        cell.imageView?.image = newStudentData.retrieveImageFor(id:Int(finalAllStudentsList[indexPath.item].STUDENTNUMBER), forceReload: false)

        //Finally, this returns the cell with the edited properties and text.
        return cell
    }
}

