//
//  FourthViewController.swift
//  GPA Calculator
//
//  Created by Justin Fraser on Friday 5/10/19.
//  Copyright © 2019 Justin Fraser. All rights reserved.
//

import Foundation
import UIKit
import EventKitUI

class FourthViewController : UIViewController { //EventKitUI Implementation

    @IBOutlet weak var calendarDate: UIDatePicker! //choosing the date
    @IBOutlet weak var eventName: UITextField! //naming the event
    
    @IBAction func createEvent(_ sender: Any) { //trigger saving the event
       let eventStore = EKEventStore()
        eventStore.requestAccess(to: .event, completion: //permission to use calendars
            {(granted: Bool, error: Error?) -> Void in
                if granted {
                    self.newEvent(store: eventStore)
                } else {
                    print("Access denied")
                }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
}
    func newEvent(store: EKEventStore) {
        
        let calendars = store.calendars(for: .event)
        
        for calendar in calendars {
            
            if calendar.title == "School" { //must have School calendar added
                
                let event = EKEvent(eventStore: store) //creating the event with information passed by user
                event.calendar = calendar
                event.title = eventName.text == "" ?  "New Event" : eventName.text
                event.startDate = calendarDate.date
                event.endDate = calendarDate.date
                do {
                    try store.save(event, span: .thisEvent) //saving the created event to the School calendar
                    
                }
                catch {
                    print("Save event failed")
                }
            }
        }
    }
}
