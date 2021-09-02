//
//  SignUpViewController.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/08/31.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    private let emailUtil    = EmailUtil()
    private let phoneUtil    = PhoneUtil()
    private let passwordUtil = PasswordUtil()

    
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
        
        signUpButtom.roundCorners(20)
        signInButton.addBorder()
        signInButton.roundCorners(20)
        setupTextField(emailTextField)
        setupTextField(nameTextField)
        setupTextField(phoneTextField)
        setupTextField(passwordTextField)
        setupTextField(repeatPasswordTextField)
        setupNotification()
        
        print(RealmManager.shared.load(User.self))
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
    
    private func signUp(email: String, name: String, phoneNumber: Int, password: String) {
        let user = User(email: email, name: name, phoneNumber: phoneNumber, password: password)
        if user.isNewUser {
            RealmManager.shared.savedUser(user)
            UserDefaults.standard.set(user.id, forKey: "userID")
            Alert.presentSignUp(on: self) { _ in
                self.transitionSplitVC()
            }
        } else {
            Alert.presentError(on: self, message: .alreadyRegistered)
        }
    }
    
    private func checkInputField() {
        let emailIsEmpty             = emailTextField.text?.isEmpty ?? false
        let nameIsEmpty              = nameTextField.text?.isEmpty ?? false
        let phoneNumberStringIsEmpty = phoneTextField.text?.isEmpty ?? false
        let passwordIsEmpty          = passwordTextField.text?.isEmpty ?? false
        let repeatPasswordIsEmpty    = repeatPasswordTextField.text?.isEmpty ?? false
        
        if emailIsEmpty || nameIsEmpty || phoneNumberStringIsEmpty || passwordIsEmpty || repeatPasswordIsEmpty {
            Alert.presentError(on: self, message: .noInput)
            return
        }
        
        // 名前
        let name = nameTextField.text!
        
        // メールアドレス
        guard let email = emailUtil.parse(emailTextField.text!) else {
            Alert.presentError(on: self, message: .invalidEmail)
            return
        }
        
        // 電話番号
        guard let phoneNumber = phoneUtil.parse(phoneTextField.text!) else {
            Alert.presentError(on: self, message: .invalidPhoneNumber)
            return
        }
        
        // パスワードと再入力パスワード
        guard let password = passwordUtil.parse(passwordTextField.text!),
            let repeatPassword = passwordUtil.parse(repeatPasswordTextField.text!) else {
                Alert.presentError(on: self, message: .invalidPasssword)
                return
        }
        
        // パスワードと再入力パスワードが一致するか確認する
        if password != repeatPassword {
            Alert.presentError(on: self, message: .notMatchPassword)
            return
        }
        
        signUp(email: email, name: name, phoneNumber: phoneNumber, password: password)
    }
    
    private func transitionSplitVC() {
        guard let splitVC = storyboard?.instantiateViewController(withIdentifier: SplitViewController.reuseIdentifier) as? SplitViewController else { return }
        present(splitVC, animated: true)
    }
    
    
    @IBAction private func tappedCloseButton(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction private func tappedSignUpButton(_ sender: UIButton) {
        checkInputField()
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
