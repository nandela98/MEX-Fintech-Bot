//
//  Reusable.swift
//  FintechBot
//
//  Created by Sanjeeva Reddy Nandela on 7/12/22.
//

import UIKit

protocol Reusable {}

// MARK: UITableView
extension Reusable where Self: UITableViewCell  {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: Reusable {}
