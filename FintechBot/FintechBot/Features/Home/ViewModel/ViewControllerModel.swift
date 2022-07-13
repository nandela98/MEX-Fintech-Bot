//
//  ViewControllerModel.swift
//  FintechBot
//
//  Created by Sanjeeva Reddy Nandela on 7/13/22.
//

import Foundation

protocol ViewControllerModelProtocol {
    func fetchUserData() -> [User]?
}

final class ViewControllerModel: ViewControllerModelProtocol {
    
    func fetchUserData() -> [User]? {
        let users = Bundle.main.decode([User].self, from: "userData.json")
        return users
    }
    
}
