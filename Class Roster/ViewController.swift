//
//  ViewController.swift
//  Class Roster Part 4
//
//  Created by Kevin Pham on 8/18/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {
    
    var teachers = [Person]()
    var students = [Person]()
    var teacherInfo = [["firstName" : "John", "lastName" : "Clem"], ["firstName" : "Brad", "lastName" : "Johnson"]]
    var studentInfo = [["firstName" : "Jake", "lastName" : "Foster"], ["firstName" : "Bamboo", "lastName" : "Nguyen"], ["firstName" : "Khanh", "lastName" : "Nguyen"], ["firstName" : "Nathan", "lastName" : "Peterson"], ["firstName" : "Kevin", "lastName" : "Pham"]]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.teacherArray(teacherInfo)
        self.studentArray(studentInfo)
    }
    
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func teacherArray(teacherArray: NSArray) {
        for teacher in teacherArray {
            var newPerson = Person(firstName: teacher["firstName"] as String, lastName: teacher["lastName"] as String)
            teachers.append(newPerson)
        }
    }
    
    func studentArray(studentArray: NSArray) {
        for student in studentArray {
            var newPerson = Person(firstName: student["firstName"] as String, lastName: student["lastName"] as String)
            students.append(newPerson)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return self.teachers.count
        default:
            return self.students.count
        }
    }
    
    func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String! {
        switch section {
        case 0:
            return "Teachers"
        default:
            return "Students"
        }
    }
    
    //
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        var personForRow : Person
        switch indexPath.section {
        case 0:
            personForRow = self.teachers[indexPath.row]
        default:
            personForRow = self.students[indexPath.row]
        }
        cell.textLabel.text = personForRow.fullName()
        cell.imageView.image = UIImage(named: "default.jpg")
        
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var studentForRow = self.students[indexPath.row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // println("Preparing for a Segue Show")
        if segue.identifier == "showDetail" {
            var detailViewController = segue.destinationViewController as DetailViewController
            let section = tableView.indexPathForSelectedRow().section
            let row = tableView.indexPathForSelectedRow().row
            
            var personForRow : Person
            switch tableView.indexPathForSelectedRow().section {
            case 0:
                personForRow = teachers[row]
            default:
                personForRow = students[row]
            }
            
            detailViewController.selectedPerson = personForRow
        // } else {
            // println("Add Segue GO!")
        }
    }
    
    @IBAction func cancelButton(segue: UIStoryboardSegue) {
        // println("Fired exit segue!")
    }
    
}