//
//  FeedViewController.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/24.
//

import UIKit

// MARK: 테이블 뷰 셀 identifier
enum FeedTableViewCellIdentifier {
    case story, feed
    
    var desc: String {
        switch self {
        case .story:
            return "StoryTableViewCell"
        case .feed:
            return "FeedTableViewCell"
        }
    }
}

class FeedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var feedListData: [Feed] = [] { didSet { tableView.reloadData() } }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 피드 데이터 가져오기
        FeedService().getFeedData(parameters: FeedInput(limit: 10, page: 0)) { [weak self] data in
            self?.feedListData = data
        }
        setupTableView()
    }
}

// MARK: - Extension
private extension FeedViewController {
    // MARK: 테이블 뷰 설정
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: FeedTableViewCellIdentifier.story.desc, bundle: nil), forCellReuseIdentifier: FeedTableViewCellIdentifier.story.desc)
        tableView.register(UINib(nibName: FeedTableViewCellIdentifier.feed.desc, bundle: nil), forCellReuseIdentifier: FeedTableViewCellIdentifier.feed.desc)
        
        // 테이블 뷰 separator 숨김
        tableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    // 섹션 개수
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // 섹션별 셀 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return self.feedListData.count
        }
    }
    
    // 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCellIdentifier.story.desc, for: indexPath) as! StoryTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCellIdentifier.feed.desc, for: indexPath) as! FeedTableViewCell
            cell.updateUI(feedListData[indexPath.row])
            return cell
        }
    }
    
    // 셀 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 70
        } else {
            return 600
        }
    }
}
