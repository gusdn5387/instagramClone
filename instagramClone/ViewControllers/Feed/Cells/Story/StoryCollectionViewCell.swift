//
//  StoryCollectionViewCell.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/27.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileUserLabel: UILabel!
    
    @IBOutlet weak var smallBackgroundView: UIView!
    @IBOutlet weak var bigBackgroundView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLayout()
    }
}

// MARK: - Extension
private extension StoryCollectionViewCell {
    // MARK: 레이아웃 설정
    func setupLayout() {
        profileImageView.layer.cornerRadius = 17.5
        smallBackgroundView.layer.cornerRadius = 18.5
        bigBackgroundView.layer.cornerRadius = 20
    }
}
