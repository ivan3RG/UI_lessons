//
//  ViewController.swift
//  VK app
//
//  Created by Иван Кочетков on 23.08.2020.
//  Copyright © 2020 Ivan Kochetkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue){
        
    }
    
    
    
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
        if loginTextField.text == "Uzver" && pwdTextField.text == "Parol" {
            return true
        }
        return false
    }


}

