//
//  RealmManager.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private let realm = try! Realm()
    
    
    private init() {}
    
    
    private func write<T: Object>(_ object: T) {
        do {
            try realm.write { realm.add(object) }
        } catch {
            print(error)
        }
    }
    
    
    func load<T: Object>(_ object: T.Type) -> Results<T> {
        return realm.objects(object)
    }
    
    func loadUser(email: String, password: String) -> User? {
        let user = realm.objects(User.self)
            .filter("email == '\(email)' && password == '\(password)'")
        return user.first
    }
    
    func loadUserByPrimaryKey(_ key: String) -> User? {
        return realm.object(ofType: User.self, forPrimaryKey: key)
    }
    
    func savedUser(_ user: User) {
        write(user)
    }
    
}
