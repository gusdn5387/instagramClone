//
//  String+Validate.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/21.
//

import UIKit

extension String {
    // MARK: 사용자 이름 유효성 검사
    func isValidUserName() -> Bool {
        let userNameRegEx = "^[A-Za-z0-9._]{5,19}$"
        return self.range(of: userNameRegEx, options: .regularExpression) != nil
    }
    
    // MARK: 비밀번호 유효성 검사
    func isValidPassword() -> Bool {
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{8,50}"
        return self.range(of: passwordRegEx, options: .regularExpression) != nil
    }
    
    // MARK: 이메일 유효성 검사
    func isValidEmail() -> Bool {
        let emailRegEx = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}$"
        return self.range(of: emailRegEx, options: .regularExpression) != nil
    }
    
    // MARK: 전화번호 유효성 검사
    func isValidPhone() -> Bool {
        let phoneRegEx = "^01([0-9])-?([0-9]{3,4})-?([0-9]{4})$"
        return self.range(of: phoneRegEx, options: .regularExpression) != nil
    }
}
