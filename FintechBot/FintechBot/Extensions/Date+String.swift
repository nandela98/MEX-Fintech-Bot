//
//  Date+String.swift
//  FintechBot
//
//  Created by Sanjeeva Reddy Nandela on 7/13/22.
//

import Foundation

extension Date {
    
    func today(format : String = "yyyy-MM-dd'T'HH:mm:ss.SSS") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}
