//
//  SecondViewController.swift
//  GPA Calculator
//
//  Created by Justin Fraser on Thursday 5/9/19.
//  Copyright © 2019 Justin Fraser. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    //labels of classes inputted from user
    @IBOutlet weak var aBlockLabel: UILabel?
    @IBOutlet weak var bBlockLabel: UILabel?
    @IBOutlet weak var cBlockLabel: UILabel?
    @IBOutlet weak var dBlockLabel: UILabel?
    @IBOutlet weak var eBlockLabel: UILabel?
    @IBOutlet weak var fBlockLabel: UILabel?
    @IBOutlet weak var gBlockLabel: UILabel?
    
    //text fields of grades inputted by the user
    @IBOutlet weak var aBlockGrade: UITextField!
    @IBOutlet weak var bBlockGrade: UITextField!
    @IBOutlet weak var cBlockGrade: UITextField!
    @IBOutlet weak var dBlockGrade: UITextField!
    @IBOutlet weak var eBlockGrade: UITextField!
    @IBOutlet weak var fBlockGrade: UITextField!
    @IBOutlet weak var gBlockGrade: UITextField!
    
    //values fetched from ViewController.swift
    var aBlockLabelText = String()
    var bBlockLabelText = String()
    var cBlockLabelText = String()
    var dBlockLabelText = String()
    var eBlockLabelText = String()
    var fBlockLabelText = String()
    var gBlockLabelText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //values above assigned to the labels, or just the block if empty
        aBlockLabel?.text = aBlockLabelText == "" ? "A Block" : aBlockLabelText
        bBlockLabel?.text = bBlockLabelText == "" ? "B Block" : bBlockLabelText
        cBlockLabel?.text = cBlockLabelText == "" ? "C Block" : cBlockLabelText
        dBlockLabel?.text = dBlockLabelText == "" ? "D Block" : dBlockLabelText
        eBlockLabel?.text = eBlockLabelText == "" ? "E Block" : eBlockLabelText
        fBlockLabel?.text = fBlockLabelText == "" ? "F Block" : fBlockLabelText
        gBlockLabel?.text = gBlockLabelText == "" ? "G Block" : gBlockLabelText
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DestViewController : ThirdViewController = segue.destination as! ThirdViewController
        //Assigns inputted grade values to the class structs
        aBlock.grade = Double(aBlockGrade.text!) ?? 0
        bBlock.grade = Double(bBlockGrade.text!) ?? 0
        cBlock.grade = Double(cBlockGrade.text!) ?? 0
        dBlock.grade = Double(dBlockGrade.text!) ?? 0
        eBlock.grade = Double(eBlockGrade.text!) ?? 0
        fBlock.grade = Double(fBlockGrade.text!) ?? 0
        gBlock.grade = Double(gBlockGrade.text!) ?? 0
        
        //calculates the individual gpa numbers of each class
        aBlock.calculateGPA()
        bBlock.calculateGPA()
        cBlock.calculateGPA()
        dBlock.calculateGPA()
        eBlock.calculateGPA()
        fBlock.calculateGPA()
        gBlock.calculateGPA()
        
        
        calcTotalGPA() //calculates the gpa using all of the individual class gpas
        DestViewController.finalGPA = String(round(100*GPA)/100) //rounds gpa and passes it to the label on the final screen
        
        
    }
}
