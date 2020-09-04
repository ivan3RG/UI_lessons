//
//  ViewController.swift
//  VK app
//
//  Created by Иван Кочетков on 23.08.2020.
//  Copyright © 2020 Ivan Kochetkov. All rights reserved.
//

import UIKit

var login = ""
var password = ""

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
    
    @IBOutlet weak var trigger: UISegmentedControl!
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(notification: Notification) {
        guard let keyboardRect = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        
        scrollView.contentInset.bottom = keyboardRect.height
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if trigger.selectedSegmentIndex == 0 && loginTextField.text == login && pwdTextField.text == password && login != "" && password != "" {
            errorLabel.text = ""
            return true
        } else if trigger.selectedSegmentIndex == 1 {
            password = pwdTextField.text ?? ""
            login = loginTextField.text ?? ""
            errorLabel.text = "Пользователь зарегистрирован"
            return false
        }
        errorLabel.text = "Введены неверные данные"
        return false
    }


}

