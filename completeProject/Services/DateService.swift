//
//  DateService.swift
//  completeProject
//
//  Created by Aakarsh Yadav on 04/10/20.
//

import Foundation

class DataService {
    static let instace = DataService()
    
    private let users = [User]()
    
    func getUsers() -> [User]{
        return users
    }
}
