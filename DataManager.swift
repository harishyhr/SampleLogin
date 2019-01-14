//
//  DataManager.swift
//  Spectrum
//
//  Created by Harish on 14/12/18.
//  Copyright © 2018 Harish. All rights reserved.
//

import Foundation

class DataManager {
    static let manager = DataManager()
    
    private var users = [User]()
    
    private init() {}
    
    var userCount: Int {
        return users.count
    }
    
    func getUserName(at index: Int) -> String {
        let user = users[index]
        return user.username
    }
    
    func insertUser(user: User) {
        users.append(user)
    }
}
