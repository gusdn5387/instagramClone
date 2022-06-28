//
//  ProfileCollectionReusableView.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/27.
//

import UIKit

class ProfileCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileCollectionReusableView"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var plusImageView: UIImageView!
    @IBOutlet weak var profileEditButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }
}

// MARK: - Extension
private extension ProfileCollectionReusableView {
    func setupLayout() {
        profileImageView.layer.cornerRadius = 44
        plusImageView.layer.cornerRadius = 12
        
        profileEditButton.layer.cornerRadius = 5
        profileEditButton.layer.borderColor = UIColor.lightGray.cgColor
        profileEditButton.layer.borderWidth = 1
    }
}
