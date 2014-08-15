//
//  DetailViewController.swift
//  Class Roster Part 3
//
//  Created by Kevin Pham on 8/14/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var fullNameLbl: UILabel!
    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedPerson : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        // super.viewWillAppear(true)
        self.fullNameLbl.text = selectedPerson!.fullName()
        self.firstNameTxtField.text = selectedPerson!.firstName
        self.lastNameTxtField.text = selectedPerson!.lastName
        
        self.imageView.image = UIImage(named: "default.jpg")
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.selectedPerson?.firstName = self.firstNameTxtField.text
        self.selectedPerson?.lastName = self.lastNameTxtField.text
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func imageTouched() {
//        var imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.allowsEditing = true
//        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//        self.presentViewController(imagePicker, animated: true, completion: nil)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
