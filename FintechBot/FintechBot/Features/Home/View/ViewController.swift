//
//  ViewController.swift
//  FintechBot
//
//  Created by Sanjeeva Reddy Nandela on 7/12/22.
//

import UIKit

final class ViewController: BaseTableViewSearchController<UserCell, User> {

   private let viewModel: ViewControllerModelProtocol = ViewControllerModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBarButtonItems()
        
        if let users = viewModel.fetchUserData() {
            self.models = users
        }
        
    }
   
}

fileprivate extension ViewController {
    
    func setupNavBarButtonItems() {
        let leftNavBtn = UIBarButtonItem(barButtonSystemItem: .add,
                                         target: self,
                                         action: #selector(addTapped))
        
        let rightNavBtn = UIBarButtonItem(title: "Sort",
                                          style: .plain,
                                          target: self,
                                          action: #selector(sortTapped))
        
        navigationItem.leftBarButtonItem = leftNavBtn
        navigationItem.rightBarButtonItem = rightNavBtn
    }
    
    @objc func addTapped() {
        
    }
    
    @objc func sortTapped() {
        
    }
    
}

