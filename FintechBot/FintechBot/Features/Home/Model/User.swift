//
//  User.swift
//  FintechBot
//
//  Created by Sanjeeva Reddy Nandela on 7/12/22.
//

import Foundation

struct User: Codable, Searchable {
    
    var query: String {
        return name
    }
    
    let name: String

    var creationDate: String = Date().today(format: "MMM dd, yyyy")
    
    var image: String = "profileIcon"
    
}
