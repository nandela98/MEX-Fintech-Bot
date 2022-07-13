//
//  ViewControllerModel.swift
//  FintechBot
//
//  Created by Sanjeeva Reddy Nandela on 7/13/22.
//

import Foundation

enum SortType {
    case ascending
    case descending
}

protocol ViewControllerModelProtocol {
    func fetchUserData(completion: @escaping () -> ())
    func sortUserDataByDate()
    func sortBotNameBy(_ sortType: SortType)
    func insertNewBots(_ name: String)
    func isUniqueBot(_ name: String) -> Bool
    var  users: [User]? { get set }
}

final class ViewControllerModel: ViewControllerModelProtocol {
    
    var users: [User]?
    
    /**
       This method is used to fetch data from json file
    */
    func fetchUserData(completion: @escaping () -> ()) {
        self.users = Bundle.main.decode([User].self, from: "userData.json")
        sortUserDataByDate()
        completion()
    }
    
    /**
       This method is used to sort all the bots by creationDate
    */
    func sortUserDataByDate() {
        self.users = self.users?.sorted(by: { user1, user2 in
            user1.creationDate > user2.creationDate
        })
    }
    
    /**
       This method is used to sort all the bots by name
    */
    func sortBotNameBy(_ sortType: SortType) {
        self.users = self.users?.sorted { (user1, user2) -> Bool in
            if user1.name.count == user2.name.count {
                return user1.name < user2.name
            } else {
                switch sortType {
                case .ascending:
                    return user1.name.count < user2.name.count
                case .descending:
                    return user1.name.count > user2.name.count
                }
            }
        }
    }
    
    /**
       This method is used to add new bots in array
    */
    func insertNewBots(_ name: String) {
        let user = User(name: name)
        users?.insert(user, at: 0)
    }
    
    /**
       This method is used to find wether the entered bot name is uunique or not
    */
    func isUniqueBot(_ name: String) -> Bool {
        if users?.contains(where: {$0.name.caseInsensitiveCompare(name) == ComparisonResult.orderedSame }) ??  false {
           return false
        }
        return true
    }
    
}
