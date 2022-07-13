//
//  UserCell.swift
//  FintechBot
//
//  Created by Sanjeeva Reddy Nandela on 7/12/22.
//

import Foundation
import UIKit

class UserCell: BaseTableViewCell<User> {
    
    override var item: User? {
        didSet {
            textLabel?.text = item?.name
            detailTextLabel?.text = item?.creationDate ?? "NA"
            imageView?.image = UIImage(named: item?.image ?? "")
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "\(UserCell.self)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
