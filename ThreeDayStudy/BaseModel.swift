//
//  BaseModel.swift
//  ThreeDayStudy
//
//  Created by le tong on 2019/9/27.
//  Copyright © 2019 iOS. All rights reserved.
//

import UIKit

class BaseModel: NSObject {
    var iconImage: String
    var name: String
    var content: String
    var modelArray:[models] = []
    
    init(iconImage: String, name: String, content: String, array: Array<models>) {
        self.iconImage = iconImage
        self.name = name
        self.content = content
        self.modelArray = array
    }
    
}
class models: NSObject {
    var icon: String
    var name: String
    
    init(icon: String, name: String) {
        self.icon = icon
        self.name = name
    }
    
}
