//
//  User.swift
//  LessonsKukorin2016
//
//  Created by Владимир Невинный on 27.01.16.
//  Copyright © 2016 Владимир Невинный. All rights reserved.
//

import UIKit

class User {
    var id: String
    var fullName: String
    var email: String
    var profileImage: UIImage!
    var cardId = [String]()
    
    
    init(id: String, fullName: String, email: String, profileImage: UIImage!) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.profileImage = profileImage
    }
    
    class func allUsers() -> [User] {
        return [User(id: "a1", fullName: "Nevinniy", email: "nvovap@mail.ru", profileImage: UIImage(named: "account"))]
    }
    
    
}
