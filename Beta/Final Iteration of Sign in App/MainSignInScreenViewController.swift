//
//  MainSignInScreenViewController.swift
//  Final Iteration of Sign in App
//
//  Created by Stewart  Zurbuch on 12/12/19.
//  Copyright © 2019 Stewart  Zurbuch. All rights reserved.
//
import UIKit
public var currentID: String = ""
var newStudentData = StudentData()
var jsonFile: String = "https://socrates.standrews-de.org/api2/csdata.cfm"
var currentStudentArray: [Student] = newStudentData.students
class MainSignInScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var numLabel1: UILabel!
    @IBOutlet weak var numLabel2: UILabel!
    @IBOutlet weak var numLabel3: UILabel!
    @IBOutlet weak var numLabel4: UILabel!
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if numLabel1.text == "__" {
            numLabel1.text = sender.titleLabel!.text
            currentID += sender.titleLabel!.text!
        }
        else if numLabel2.text == "__" {
            numLabel2.text = sender.titleLabel!.text
            currentID += sender.titleLabel!.text!
        }
        else if numLabel3.text == "__" {
            numLabel3.text = sender.titleLabel!.text
            currentID += sender.titleLabel!.text!
        }
        else if numLabel4.text == "__" {
            numLabel4.text = sender.titleLabel!.text
            currentID += sender.titleLabel!.text!
        }
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


// Struct to hold individual student records.
//   Property names must match JSON.
struct Student:Codable {
    var STUDENTNUMBER:Double
    var STUDENTFIRSTNAME:String
    var STUDENTLASTNAME:String
    var STUDENTSEX:String
    var STUDENTFORM:Double
    var STUDENTDORM:String
}

// Used in a helper function to create blank UIImages.
extension UIImage {
    static func fromColor(_ color: UIColor, size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { context in
            color.setFill()
            context.fill(CGRect(origin: .zero, size: size))
        }
    }
}

// Main class to handle all data
class StudentData {
    public var students:[Student]
    
    // These properties store the data for accessing student data.
    //   Might want to change to VARs if you are going to allow changing.
    let imageURL:String
    let imageEXT:String
    let jsonSource:String
    
    init() {
        imageURL = "https://socrates.standrews-de.org/students/studentpics/"
        imageEXT = ".jpg"
        jsonSource = "https://socrates.standrews-de.org/api2/csdata.cfm"
        
        // Try to load student database from persistent storage.
        //   Create empty student DB if not found.
        if let data = UserDefaults.standard.value(forKey:"studentDB") as? Data,
            let array = try? PropertyListDecoder().decode(Array<Student>.self, from: data) {
                print("** init() : Found student DB.")
                students = array
        } else {
            print("** init() : Attempting to sync student DB.")
            students = [Student]()
            syncStudentDB()
        }
    }
    
    // Method to retrieve new student database from Socrates.
    //   Overwrites old database.
    public func syncStudentDB() {
        if let url = URL(string: jsonSource) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    do {
                        self.students = try JSONDecoder().decode([Student].self, from: data)
                        // print( self.students.count )
                    
                    } catch let error {
                        print(error)
                    }
                }
            }
            task.resume()
            while task.state != .completed {
                print(".")
                Thread.sleep(forTimeInterval: 0.1)
            }
            print("** syncStudentDB() : Loaded \(students.count) records.")
            storeStudents(array: students, forKey: "studentDB")

        }
    }
    
    // Method to retrieve a student image via ID number.
    //   Setting forceReload to true will always retrieve image via website,
    //   otherwise will attempt to load image from persistent storage.
    public func retrieveImageFor(id:Int, forceReload:Bool) -> UIImage {
        if ( forceReload ) {
            return retrieveImageFor(id: id)
        }
        if let image = retrieveImage(forKey:"\(id)") {
            print("Found image for id \(id).")
            return image
        } else {
            print("Fetching image for id \(id).")
            return retrieveImageFor(id: id)
        }
    }
    
    // Method to retrieve a student record by ID #.
    //   Returns nil if not found.
    public func getStudentBy(id: Int) -> Student? {
        print(students.count)
        for s:Student in students {
            if id == Int(s.STUDENTNUMBER) {
                return s
            }
        }
        return nil
    }
    
    
    //---------  Helper Functions -------------
    private func retrieveImageFor(id:Int) -> UIImage {
        if let url = URL(string: imageURL + "\(id)" + imageEXT ),
            let data = try? Data(contentsOf: url) {
            //return UIImage(data: data) ?? UIImage.fromColor(.red, size: CGSize(width: 300, height: 400))
            if let image = UIImage(data: data) {
                storeImage(image: image, forKey: "\(id)")
                return image
            }
        }
        // Something bad happened
        print("URL load failed for id: \(id)")
        return UIImage.fromColor(.blue, size: CGSize(width: 300, height: 400))
        
    }
    
    private func storeStudents(array: [Student], forKey key:String) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(array),forKey: key)
        
    }
    
    private func retrieveStudents(forKey key:String) -> [Student] {
        if let data = UserDefaults.standard.value(forKey:key) as? Data {
            let array = try? PropertyListDecoder().decode(Array<Student>.self, from: data)
            return array!
        }
        return [Student]()
    }
    
    private func storeImage(image: UIImage, forKey key: String) {
        if let pngRepresentation = image.pngData() {
                if let filePath = filePath(forKey: key) {
                    do  {
                        try pngRepresentation.write(to: filePath,
                                                    options: .atomic)
                    } catch let err {
                        print("Saving file resulted in error: ", err)
                    }
                }
            }
        
    }

    private func retrieveImage(forKey key: String) -> UIImage? {
            if let filePath = self.filePath(forKey: key),
                let fileData = FileManager.default.contents(atPath: filePath.path),
                let image = UIImage(data: fileData) {
                return image
            }
        
        
        return nil
    }
    private func filePath(forKey key: String) -> URL? {
        let fileManager = FileManager.default
        guard let documentURL = fileManager.urls(for: .documentDirectory,
                                                in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
        
        return documentURL.appendingPathComponent(key + ".png")
    }
}
