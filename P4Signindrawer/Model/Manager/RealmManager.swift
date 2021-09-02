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
    
    func savedUser(_ user: User) {
        write(user)
    }
    
}
