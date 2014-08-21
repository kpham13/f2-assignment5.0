//
//  DetailViewController.swift
//  Class Roster Part 4
//
//  Created by Kevin Pham on 8/18/14.
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
//        let imageTap = UITapGestureRecognizer(target: self, action: NSSelectorFromString("imageTouched"))
//        self.imageView.addGestureRecognizer(imageTap)
        var defaultProfileImage = UIImage(named: "default.jpg")
        self.imageView.image = defaultProfileImage
    }
    
    override func viewWillAppear(animated: Bool) {
        // super.viewWillAppear(true)
        self.fullNameLbl.text = selectedPerson!.fullName()
        self.firstNameTxtField.text = selectedPerson!.firstName
        self.lastNameTxtField.text = selectedPerson!.lastName
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.selectedPerson?.firstName = self.firstNameTxtField.text
        self.selectedPerson?.lastName = self.lastNameTxtField.text
        
        if self.selectedPerson?.profileImage {
            self.imageView.image = self.selectedPerson?.profileImage
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func photoButton(sender: UIButton) {
        var imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        // imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        var editedImage = info[UIImagePickerControllerOriginalImage] as UIImage
        self.imageView.image = editedImage
        self.selectedPerson?.profileImage = editedImage
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
   
//    let profileImage = info[UIImagePickerControllerOriginalImage] as UIImage
//    self.imageView.image = profileImage
//    self.selectedPerson.image = profileImage
//    self.selectedPerson.hasImage = true
//    self.saveImageToDocumentsDirectory(originalImage)
//    self.dismissViewControllerAnimated(true, completion: nil)
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
