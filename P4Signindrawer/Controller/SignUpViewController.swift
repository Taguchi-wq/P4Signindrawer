//
//  SignUpViewController.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var repeatPasswordTextField: UITextField!
    @IBOutlet private weak var signUpButtom: UIButton!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var closeButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signUpButtom.roundCorners(30)
        signInButton.addBorder()
        signInButton.roundCorners(30)
        setupTextField(emailTextField)
        setupTextField(nameTextField)
        setupTextField(phoneTextField)
        setupTextField(passwordTextField)
        setupTextField(repeatPasswordTextField)
        setupNotification()
    }
    
    
    private func setupTextField(_ textField: UITextField) {
        textField.delegate = self
        textField.addBottomBorder()
    }
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    
    @IBAction private func tappedCloseButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction private func tappedSignUpButton(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction private func tappedSignInButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}


// キーボード周りの処理
extension SignUpViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc
    private func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            } else {
                let suggestionHeight = self.view.frame.origin.y + keyboardSize.height
                self.view.frame.origin.y -= suggestionHeight
            }
        }
    }
    
    @objc
    private func keyboardWillHide() {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
}



extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addBottomBorder(color: Color.jec)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.addBottomBorder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
