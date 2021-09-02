//
//  User.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var id          = NSUUID().uuidString
    @objc dynamic var email       = String()
    @objc dynamic var name        = String()
    @objc dynamic var phoneNumber = Int()
    @objc dynamic var password    = String()
    
    
    convenience init(email: String, name: String, phoneNumber: Int, password: String) {
        self.init()
        
        self.email       = email
        self.name        = name
        self.phoneNumber = phoneNumber
        self.password    = password
    }
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    
    var isNewUser: Bool {
        let user = RealmManager.shared.load(User.self)
            .filter("email == '\(email)'")
        
        if user.isEmpty {
            return true
        } else {
            return false
        }
    }
    
}
