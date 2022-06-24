//
//  EnterIdViewController.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/20.
//

import UIKit

class EnterIdViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var userName: String = "" { didSet { self.checkUserNameForm() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isEnabled = false
    }
    
    // MARK: - @IBAction
    
    // MARK: 사용자 이름 입력 이벤트
    @IBAction func userNameTextFieldEditingChanged(_ sender: UITextField) {
        self.userName = sender.text ?? ""
    }
    
    // MARK: "다음" 버튼 눌렀을 때 이벤트
    @IBAction func didTapNextButton(_ sender: Any) {
        if userName.isValidUserName() {
            UserModel.shared.tempUserName = userName
            pushToEnterPw()
        } else {
            let alert = Helper().alert(title: "올바르지 않은 입력입니다.", msg: "사용자 이름은 5글자 이상 19글자 이하여야 하며 영문과 숫자, 특수문자(._)만 조합하실 수 있습니다.")
            present(alert, animated: true)
        }
    }
}

// MARK: - Extension
private extension EnterIdViewController {
    // MARK: 사용자 이름 만들기 폼 체크
    func checkUserNameForm() {
        if userName.count >= 5 {
            nextButton.isEnabled = true
        }
    }
    
    // MARK: "비밀번호 만들기"로 이동
    func pushToEnterPw() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "EnterPwViewController") as! EnterPwViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
