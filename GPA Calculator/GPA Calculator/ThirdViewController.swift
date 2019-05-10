//
//  ThirdViewController.swift
//  GPA Calculator
//
//  Created by Justin Fraser on Thursday 5/9/19.
//  Copyright © 2019 Justin Fraser. All rights reserved.
//

import Foundation
import UIKit

class ThirdViewController: UIViewController {
    
    var finalGPA = String() //value from SecondViewController.swift
    
    @IBOutlet weak var gpaDisplay: UILabel! //the label displaying gpa
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gpaDisplay.text = finalGPA //assigns final gpa to the label
    }
}
