//
//  ViewController.swift
//  FintechBot
//
//  Created by Sanjeeva Reddy Nandela on 7/12/22.
//

import UIKit

final class ViewController: BaseTableViewSearchController<UserCell, User> {

    // MARK: Declaration
    
    let viewModel: ViewControllerModelProtocol = ViewControllerModel()
    private var sortByName = true
    
    // MARK: View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBarButtonItems()
        viewModel.fetchUserData { [weak self] in
            self?.updateTableView()
        }
    }
    
}

// MARK: Setup

fileprivate extension ViewController {
    
    /**
     This method is used to setup NavBar Button Items Add and Sort

    */
    func setupNavBarButtonItems() {
        let leftNavBtn = UIBarButtonItem(barButtonSystemItem: .add,
                                         target: self,
                                         action: #selector(addNewBotTapped))
        
        let rightNavBtn = UIBarButtonItem(title: "Sort",
                                          style: .plain,
                                          target: self,
                                          action: #selector(sortByNameTapped))
        
        navigationItem.leftBarButtonItem = leftNavBtn
        navigationItem.rightBarButtonItem = rightNavBtn
        navigationItem.title = "Fintech Bot"
    }
    
    /**
     This method is used to add new bots
    */
    @objc func addNewBotTapped() {
        showPopupOn(controller: self) { textFieldName in
            self.insertNewBots(botName: textFieldName)
        }
    }
    
    /**
     This method is used to sort all the bots by name
    */
    @objc func sortByNameTapped() {
        if sortByName {
            viewModel.sortBotNameBy(.descending)
            sortByName = false
        }else {
            viewModel.sortBotNameBy(.ascending)
            sortByName = true
        }
        updateTableView()
    }
    
    /**
     This method is used to add/insert new botNames saved via popup/alert
     - parameter botName: input name from popup

    */
    func insertNewBots(botName: String) {
        self.viewModel.insertNewBots(botName)
        self.viewModel.sortUserDataByDate()
        self.updateTableView()
    }
    
    /**
     This method is used to update the model and model has didSet of tableView reload
    */
    func updateTableView() {
        if let users = viewModel.users {
            self.models = users
        }
    }
    
}

