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
    
    // MARK: "다음" 버튼 눌렀을 때 이벤트
    @IBAction func didTapNextButton(_ sender: Any) {
        // 전화번호 또는 이메일 주소 하나라도 입력되어야 함
        let isValidPhoneOrEmail = phone.count > 0 || email.count > 0
        // 전화번호 유효성 검사 체크
        let isValidPhone: Bool = (phone.count > 0 && phone.isValidPhone()) || phone.count == 0
        // 이메일 주소 유효성 검사 체크
        let isValidEmail: Bool = (email.count > 0 && email.isValidEmail()) || email.count == 0
        
        if isValidPhoneOrEmail && isValidPhone && isValidEmail {
            print("이메일 주소: \(self.email), 전화번호: \(self.phone)")
        } else {
            let alert = Helper().alert(title: "올바르지 않은 입력입니다.", msg: "전화번호 또는 이메일을 확인해주세요.")
            present(alert, animated: true)
        }
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
