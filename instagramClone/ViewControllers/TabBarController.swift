//
//  TabBarController.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

// MARK: - Extension
private extension TabBarController {
    // MARK: View 설정
    func setupView() {
        view.tintColor = .label
    }
}
