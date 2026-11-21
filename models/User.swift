//
//  User.swift
//  usermanger
//
//  Created by samiya on 11/3/26.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    var name: String
    var email: String
}
