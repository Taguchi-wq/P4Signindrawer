//
//  InputError.swift
//  P4Signindrawer
//
//  Created by cmStudent on 2021/09/02.
//  Copyright © 2021 cmStudent. All rights reserved.
//

import Foundation

public enum InputError: String, Error {
    case noInput            = "入力されていないものがあります。\n入力し直してください。"
    case invalidEmail       = "メールアドレスに間違いがある可能性があります。\n入力し直してください。"
    case invalidPhoneNumber = "電話番号を-(ハイフン)なしの11桁で入力してください"
    case invalidPasssword   = "パスワードは大文字小文字英数字を含んだ6文字以上にしてください。"
    case notMatchPassword   = "パスワードと再入力パスワードが間違っています。\n入力し直してください。"
    case alreadyRegistered  = "このユーザーはすでに登録されています。\n入力し直してください。"
    case invalidInput       = "メールアドレスまたはパスワードが間違っています。\n入力し直してください。"
}
