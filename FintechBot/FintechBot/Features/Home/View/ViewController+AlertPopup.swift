//
//  ViewController+AlertPopup.swift
//  FintechBot
//
//  Created by Sanjeeva Reddy Nandela on 7/13/22.
//

import UIKit

extension ViewController {
    
    /**
     This method is used to show popup/alert
     - parameter title: input title
     - parameter message: input message
     - parameter controller: input parent controller
     - parameter onSave: on click save button in alert
    */
    func showPopupOn(title: String?   = Constants.Alert.title,
                     message: String? = Constants.Alert.message,
                     controller: UIViewController,
                     onSave: @escaping (String) -> ()) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: Constants.Alert.save,
                                       style: .default) { (action: UIAlertAction!) -> Void in
            if let textField = alert.textFields?[0] as? UITextField, let textFieldName = textField.text {
                onSave(textFieldName)
            }
        }
        
        saveAction.isEnabled = false
        
        let cancelAction = UIAlertAction(title: Constants.Alert.cancel,
                                         style: .destructive) { (action: UIAlertAction!) -> Void in
            NotificationCenter.default.removeObserver(controller, name: UITextField.textDidChangeNotification, object: nil)
        }
        
        addTextField(alert)
        
        NotificationCenter.default.addObserver(
            forName: UITextField.textDidChangeNotification,
            object : alert.textFields?[0],
            queue  : OperationQueue.main) { (notification) -> Void in
                if let textField = alert.textFields?[0] as? UITextField, let textFieldName = textField.text {
                saveAction.isEnabled = self.viewModel.isUniqueBot(textFieldName) && !(textFieldName.isEmpty)
            }
        }
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        controller.present(alert,
                           animated: true,
                           completion: nil)
        
    }
    
    fileprivate func addTextField(_ alert: UIAlertController) {
        alert.addTextField {
            (textField: UITextField!) in
            textField.placeholder = Constants.Alert.placeholder
            textField.autocapitalizationType = .words
        }
    }
    
}
