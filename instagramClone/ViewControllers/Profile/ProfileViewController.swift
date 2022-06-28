//
//  ProfileViewController.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/24.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var feedList: [Feed] = [] { didSet { profileCollectionView.reloadData() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        FeedService().getFeedData(parameters: FeedInput(limit: 10, page: 0)) { [weak self] data in
            self?.feedList = data
        }
    }
}

// MARK: - Extension
private extension ProfileViewController {
    func setupCollectionView() {
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        profileCollectionView.register(UINib(nibName: ProfileCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        profileCollectionView.register(UINib(nibName: ProfileCollectionReusableView.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileCollectionReusableView.identifier)
//        profileCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDatasource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as! ProfileCollectionViewCell
        cell.updateUI(feedList[indexPath.row])
        
        return cell
    }
    
    // MARK: 컬렉션 뷰 헤더 만들기
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileCollectionReusableView.identifier, for: indexPath) as! ProfileCollectionReusableView
        
        return headerView
    }

    // MARK: 컬렉션 뷰 헤더 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width: CGFloat = collectionView.frame.width
        let height: CGFloat = 190

        return CGSize(width: width, height: height)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    // 셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGFloat((profileCollectionView.frame.width / 3) - 2)
        return CGSize(width: size, height: size)
    }
    
    // 셀 행 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // 셀 열 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
