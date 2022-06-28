//
//  ProfileViewController.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/24.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
}

// MARK: - Extension
private extension ProfileViewController {
    func setupCollectionView() {
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        profileCollectionView.register(UINib(nibName: ProfileCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProfileCollectionViewCell.identifier)
        profileCollectionView.register(UINib(nibName: ProfileCollectionReusableView.identifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileCollectionReusableView.identifier)
        profileCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDatasource
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCollectionViewCell.identifier, for: indexPath) as? ProfileCollectionViewCell
        
        return cell ?? UICollectionViewCell()
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
    
}
