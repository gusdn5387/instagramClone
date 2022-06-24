//
//  Helper.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/22.
//

import UIKit

class Helper {
    // MARK: alert 띄우기
    func alert(title: String, msg: String, action: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            guard let action = action else { return }
            action()
        }
        alert.addAction(okAction)
        
        return alert
    }
}
