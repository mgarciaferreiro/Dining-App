//
//  DiningLocation.swift
//  Penn Dining App
//
//  Created by Marta García Ferreiro on 9/22/18.
//  Copyright © 2018 Marta García Ferreiro. All rights reserved.
//

import UIKit
// create class that stores the properties of each dining location
class DiningLocation {
    var name: String
    var image: UIImage?
    var openClosed: String
    var hours: String
    var menuURL: String
    
    // initialize properties of the class Dining Location
    init (name: String, image: UIImage?, openClosed: String, hours: String, menuURL: String) {
        self.name = name
        self.image = image
        self.openClosed = openClosed
        self.hours = hours
        self.menuURL = menuURL
    }
}

