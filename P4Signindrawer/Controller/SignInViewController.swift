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
    }
    
    
    private func setupTextField(_ textField: UITextField) {
        textField.delegate = self
        textField.addBottomBorder()
    }
    
    
    @IBAction private func tappedSignInButton(_ sender: UIButton) {
        print(#function)
    }
    
    @IBAction private func tappedSignUpButton(_ sender: UIButton) {
        print(#function)
    }
    
}

extension SignInViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.addBottomBorder(color: Color.jec)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.addBottomBorder()
    }
    
}
