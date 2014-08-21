//
//  AddRoster.swift
//  Class Roster Part 4
//
//  Created by Kevin Pham on 8/18/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

import UIKit

class AddRoster: UIViewController, UITextFieldDelegate {

    var addPerson = [["firstName" : ""], ["lastName" : ""]]
    
    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(animated: Bool) {
        // self.addPerson?.firstName = self.firstNameTxtField.text
        // self.addPerson?.lastName = self.lastNameTxtField.text
        // println(addPerson)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(sender: UIButton) {
        println("Commit addition")
        var firstName = self.firstNameTxtField.text
        var lastName = self.lastNameTxtField.text
        println(firstName + " " + lastName)
//        var newPerson = addPerson(firstName: [firstName] as String, lastName: [lastName] as String)
//        students.append(newPerson)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
