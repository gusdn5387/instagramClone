//
//  LoginViewController.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/20.
//

import UIKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    // MARK: - "사용자 이름 만들기"로 이동
    @IBAction func pushToRegister(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: "EnterIdViewController") as! EnterIdViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
