//
//  ViewController.swift
//  GPA Calculator
//
//  Created by Justin Fraser on 3/22/19.
//  Copyright © 2019 Justin Fraser. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var proceedtoGradesButton: UISwitch! //button to switch to the grade input screen
    
    @IBOutlet weak var webview: WKWebView? //webpage view
        override func viewDidLoad() {
        super.viewDidLoad()
            
        //WebKit Implementation
        let url = URL(string:"https://shp.myschoolapp.com/app")
        let myRequest = URLRequest(url: url!)
        webview?.load(myRequest)
    }
    
    //names of classes
    @IBOutlet weak var aName: UITextField!
    @IBOutlet weak var bName: UITextField!
    @IBOutlet weak var cName: UITextField!
    @IBOutlet weak var dName: UITextField!
    @IBOutlet weak var eName: UITextField!
    @IBOutlet weak var fName: UITextField!
    @IBOutlet weak var gName: UITextField!
    
    //level of classes
    @IBOutlet weak var aLevel: UISegmentedControl!
    @IBOutlet weak var bLevel: UISegmentedControl!
    @IBOutlet weak var cLevel: UISegmentedControl!
    @IBOutlet weak var dLevel: UISegmentedControl!
    @IBOutlet weak var eLevel: UISegmentedControl!
    @IBOutlet weak var fLevel: UISegmentedControl!
    @IBOutlet weak var gLevel: UISegmentedControl!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : SecondViewController = segue.destination as! SecondViewController
        //passes text field values to the next view controller's labels
        DestViewController.aBlockLabelText = aName.text ?? "A Block"
        DestViewController.bBlockLabelText = bName.text ?? "B Block"
        DestViewController.cBlockLabelText = cName.text ?? "C Block"
        DestViewController.dBlockLabelText = dName.text ?? "D Block"
        DestViewController.eBlockLabelText = eName.text ?? "E Block"
        DestViewController.fBlockLabelText = fName.text ?? "F Block"
        DestViewController.gBlockLabelText = gName.text ?? "G Block"
        //pass text field values to the class structs to be saved to calculate the gpa later
        aBlock.name = aName.text ?? "name"
        bBlock.name = bName.text ?? "name"
        cBlock.name = cName.text ?? "name"
        dBlock.name = dName.text ?? "name"
        eBlock.name = eName.text ?? "name"
        fBlock.name = fName.text ?? "name"
        gBlock.name = gName.text ?? "name"
        //pass segmented control values to the class structs to be saved to calculate the gpa later
        aBlock.level = aLevel.titleForSegment(at: aLevel.selectedSegmentIndex)!
        bBlock.level = bLevel.titleForSegment(at: bLevel.selectedSegmentIndex)!
        cBlock.level = cLevel.titleForSegment(at: cLevel.selectedSegmentIndex)!
        dBlock.level = dLevel.titleForSegment(at: dLevel.selectedSegmentIndex)!
        eBlock.level = eLevel.titleForSegment(at: eLevel.selectedSegmentIndex)!
        fBlock.level = fLevel.titleForSegment(at: fLevel.selectedSegmentIndex)!
        gBlock.level = gLevel.titleForSegment(at: gLevel.selectedSegmentIndex)!
        
        
    }
}
struct Class { //struct for the classes a student is enrolled in
    var name: String
    var grade: Double
    var level: String
    var gradeLetter: String
    var gpa: Double
    
    mutating func calculateGPA() {
        switch grade { //turns the inputted number grade into a letter
        case 94.5...100:
            gradeLetter = "A+"
        case 89.5...94.49:
            gradeLetter = "A"
        case 84.5...89.49:
            gradeLetter = "B+"
        case 79.5...84.49:
            gradeLetter = "B"
        case 74.5...79.49:
            gradeLetter = "C+"
        case 69.5...74.49:
            gradeLetter = "C"
        case 64.5...69.49:
            gradeLetter = "D"
        default:
            gradeLetter = "F"
        }
        switch gradeLetter { //turns the letter grade into a GPA, with scale to adjust for course level
        case "A+":
            gpa = 4.5
            scale()
        case "A":
            gpa = 4.0
            scale()
        case "B+":
            gpa = 3.5
            scale()
        case "B":
            gpa = 3.0
            scale()
        case "C+":
            gpa = 2.5
            scale()
        case "C":
            gpa = 2.0
            scale()
        case "D":
            gpa = 1.0
        default:
            gpa = 0.0
        }
    }
    mutating func scale() { //Adds to the GPA based on course level
        if (level == "Honors") {
            gpa += 0.5
        }
        if (level == "AP" ) {
            gpa += 0.75
        }
    }
}
var GPA = Double()
func calcTotalGPA() { //calculates final GPA
    GPA = (aBlock.gpa + bBlock.gpa + cBlock.gpa + dBlock.gpa + eBlock.gpa + fBlock.gpa + gBlock.gpa) / 7
}
//class structs
var aBlock = Class(name: "name", grade: 0, level: "Placeholder", gradeLetter: "E", gpa: 0.0)
var bBlock = Class(name: "name", grade: 0, level: "Placeholder", gradeLetter: "E", gpa: 0.0)
var cBlock = Class(name: "name", grade: 0, level: "Placeholder", gradeLetter: "E", gpa: 0.0)
var dBlock = Class(name: "name", grade: 0, level: "Placeholder", gradeLetter: "E", gpa: 0.0)
var eBlock = Class(name: "name", grade: 0, level: "Placeholder", gradeLetter: "E", gpa: 0.0)
var fBlock = Class(name: "name", grade: 0, level: "Placeholder", gradeLetter: "E", gpa: 0.0)
var gBlock = Class(name: "name", grade: 0, level: "Placeholder", gradeLetter: "E", gpa: 0.0)
