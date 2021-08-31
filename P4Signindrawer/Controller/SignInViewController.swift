//
//  SignInViewController.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var signInWithAppleButton: UIButton!
    @IBOutlet private weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupTextField(emailTextField)
        setupTextField(passwordTextField)
        signInButton.roundCorners(30)
        signInWithAppleButton.roundCorners(30)
        signUpButton.roundCorners(30)
        signUpButton.addBorder()
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
    
    
    @IBAction private func tappedSignInButton(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction private func tappedSignUpButton(_ sender: UIButton) {
        guard let signUpVC = storyboard?.instantiateViewController(withIdentifier: SignUpViewController.reuseIdentifier) as? SignUpViewController else { return }
        present(signUpVC, animated: true)
    }
    
}


// キーボード周りの処理
extension SignInViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @objc
    private func keyboardWillShow(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= 100
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


extension SignInViewController: UITextFieldDelegate {
    
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
