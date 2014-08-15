//
//  Person.swift
//  Class Roster Part 3
//
//  Created by Kevin Pham on 8/14/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

import UIKit

class Person: NSObject, NSCoding {
    
    var firstName : String
    var lastName : String
    
    var profileImage : UIImage?
    
    init (firstName : String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func fullName() -> String {
        return firstName + " " + lastName
    }
    
    required init(coder aDecoder: NSCoder!) {
        self.firstName  = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName   = aDecoder.decodeObjectForKey("lastName") as String
    }
    
    func encodeWithCoder(aCoder: NSCoder!) {
        aCoder.encodeObject(firstName, forKey: "firstName")
        aCoder.encodeObject(lastName, forKey: "lastName")
    }
    
}