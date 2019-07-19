//
//  Classification.swift
//  FieldSurvey
//
//  Created by Mercy Housh on 7/18/19.
//  Copyright © 2019 Mercy Housh. All rights reserved.
//

import UIKit

enum Classification: String {
    case amphibian
    case bird
    case mammal
    case plant
    case fish
    case reptile
    case insect
    
    var image: UIImage? {
        return UIImage(named: self.rawValue + "Icon")
    }
}
