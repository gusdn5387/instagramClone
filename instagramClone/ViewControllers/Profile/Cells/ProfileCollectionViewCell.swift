//
//  ProfileCollectionViewCell.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/27.
//

import UIKit
import Kingfisher

class ProfileCollectionViewCell: UICollectionViewCell {
    static let identifier = "ProfileCollectionViewCell"
    
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }
    
    func updateUI(_ data: Feed) {
        let url = URL(string: data.url ?? "")
        postImageView.kf.indicatorType = .activity
        postImageView.kf.setImage(with: url)
    }
}

// MARK: - Extension
private extension ProfileCollectionViewCell {
    func setupLayout() {
        postImageView.contentMode = .scaleAspectFill
    }
}
