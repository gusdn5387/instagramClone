//
//  LoginViewController.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/20.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    // 사용자 이름, 비밀번호 값이 바뀔 때마다 checkLoginForm 함수 호출
    var userName: String = "" { didSet { self.checkLoginForm() } }
    var password: String = "" { didSet { self.checkLoginForm() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.isEnabled = false
    }
    
    // MARK: - @IBAction
    
    // MARK: 사용자 이름 입력 이벤트
    @IBAction func userNameTextFieldEditingChanged(_ sender: UITextField) {
        self.userName = sender.text ?? ""
    }
    
    // MARK: 비밀번호 입력 이벤트
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        self.password = sender.text ?? ""
    }
    
    // MARK: 로그인 버튼 눌렀을 때 이벤트
    @IBAction func didTapLoginButton(_ sender: Any) {
        if let userInfo = UserModel.shared.userInfo {
            if userInfo.userName == userName && userInfo.password == password {
                let alert = Helper().alert(title: "로그인 성공", msg: "\(userInfo)")
                present(alert, animated: true)
            } else {
                let alert = Helper().alert(title: "로그인 실패", msg: "아이디 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 한 번 확인해주세요.")
                present(alert, animated: true)
            }
        } else {
            let alert = Helper().alert(title: "로그인 실패", msg: "가입된 회원 정보가 없습니다.")
            present(alert, animated: true)
        }
    }
    
    // MARK: "사용자 이름 만들기"로 이동
    @IBAction func pushToRegister(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "EnterIdViewController") as! EnterIdViewController
        
        UserModel.shared.tempReset()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - Extension
private extension LoginViewController {
    // MARK: 로그인 폼 내용 체크
    func checkLoginForm() {
        if userName.count >= 5 && password.count >= 8 {
            loginButton.isEnabled = true
        }
    }
}
