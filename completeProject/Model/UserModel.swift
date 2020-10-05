//
//  UserModel.swift
//  completeProject
//
//  Created by Aakarsh Yadav on 04/10/20.
//

import Foundation

struct User: Codable {
    var login: String
    var avatar_url: String
    var id: Int
}
struct Users: Codable {
    var items:[User]
    var total_count: Int
}
