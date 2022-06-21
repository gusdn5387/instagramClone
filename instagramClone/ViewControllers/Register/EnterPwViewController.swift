//
//  EnterPwViewController.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/20.
//

import UIKit

class EnterPwViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var paswordCheckTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var password: String = "" { didSet { self.checkPasswordForm() } }
    var passwordCheck: String = "" { didSet { self.checkPasswordForm() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isEnabled = false
    }
    
    // MARK: - @IBAction
    
    // MARK: 비밀번호 입력 이벤트
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        self.password = sender.text ?? ""
    }
    
    // MARK: 비밀번호 확인 입력 이벤트
    @IBAction func passwordCheckTextFieldEditingChanged(_ sender: UITextField) {
        self.passwordCheck = sender.text ?? ""
    }
    
    // MARK: "다음" 버튼 눌렀을 때 이벤트
    @IBAction func didTapNextButton(_ sender: Any) {
        if password.isValidPassword() {
            // 비밀번호와 비밀번호 확인의 값이 같은 지 체크
            if password == passwordCheck {
                pushToEnterPhoneOrEmail()
            } else {
                let alert = Helper().alert(title: "올바르지 않은 입력입니다.", msg: "비밀번호와 비밀번호 확인이 일치하지 않습니다.")
                present(alert, animated: true)
            }
        } else {
            let alert = Helper().alert(title: "올바르지 않은 입력입니다.", msg: "비밀번호는 8글자 이상 50글자 이하여야 하며 영문과 숫자, 특수문자를 조합해야 합니다.")
            present(alert, animated: true)
        }
    }
}

// MARK: - Extension
private extension EnterPwViewController {
    // MARK: 비밀번호 만들기 폼 체크
    func checkPasswordForm() {
        if password.count >= 8 && passwordCheck.count >= 8 {
            nextButton.isEnabled = true
        }
    }
    
    // MARK: "전화번호 또는 이메일 주소 추가"로 이동
    func pushToEnterPhoneOrEmail() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "EnterPhoneOrEmailViewController") as! EnterPhoneOrEmailViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
