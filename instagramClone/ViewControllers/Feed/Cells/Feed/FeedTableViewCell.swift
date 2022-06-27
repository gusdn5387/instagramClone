//
//  FeedTableViewCell.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/27.
//

import UIKit
import Kingfisher

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 셀 선택 비활성화
        selectionStyle = .none
        
        // 피드 이미지뷰 비율에 맞게 꽉 차도록
        feedImageView.contentMode = .scaleAspectFill
    }
    
    // MARK: 피드 UI 업데이트
    func updateUI(_ data: Feed) {
        let url = URL(string: data.url ?? "")
        feedImageView.kf.indicatorType = .activity
        feedImageView.kf.setImage(with: url)
    }
    
    // MARK: - IBAction
    
    // MARK: 좋아요 버튼 클릭 이벤트
    @IBAction func didTapHeartButton(_ sender: Any) {
        if heartButton.isSelected {
            heartButton.isSelected = false
        } else {
            heartButton.isSelected = true
        }
    }
    
    // MARK: 북마크 버튼 클릭 이벤트
    @IBAction func didTapBookmarkButton(_ sender: Any) {
        if bookmarkButton.isSelected {
            bookmarkButton.isSelected = false
        } else {
            bookmarkButton.isSelected = true
        }
    }
}
