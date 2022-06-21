//
//  EnterPhoneOrEmailViewController.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/20.
//

import UIKit

class EnterPhoneOrEmailViewController: UIViewController {
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var phone: String = "" { didSet { checkUserInfoForm() } }
    var email: String = "" { didSet { checkUserInfoForm() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        nextButton.isEnabled = false
    }
    
    // MARK: - @IBAction
    
    // MARK: 전화번호 입력 이벤트
    @IBAction func phoneTextFieldEditingChanged(_ sender: UITextField) {
        self.phone = sender.text ?? ""
    }
    
    // MARK: 이메일 입력 이벤트
    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        self.email = sender.text ?? ""
    }
}

// MARK: - Extension
private extension EnterPhoneOrEmailViewController {
    // MARK: 사용자 정보 폼 체크
    func checkUserInfoForm() {
        if phone.count >= 13 || email.count >= 12 {
            nextButton.isEnabled = true
        }
    }
}
