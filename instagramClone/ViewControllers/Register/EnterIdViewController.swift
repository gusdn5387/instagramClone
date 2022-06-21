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
    
    // MARK: "비밀번호 만들기"로 이동
    @IBAction func pushToEnterPw(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "EnterPwViewController") as! EnterPwViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
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
}
