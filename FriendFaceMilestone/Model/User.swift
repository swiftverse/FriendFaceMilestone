//
//  User.swift
//  FriendFaceMilestone
//
//  Created by Amit Shrivastava on 22/12/21.
//

import Foundation
import SwiftUI

struct Friend: Codable {
    var name: String
    var id: String
}

struct User: Codable {
    var id: String
    var name: String
    var isActive: Bool
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date?
    var tags: [String]
    var friends: [Friend]
    
    
    var registerDateFormat: String {
        registered?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}


