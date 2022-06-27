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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        FeedService().getFeedData(parameters: FeedInput(limit: 10, page: 0))
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
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension FeedViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCellIdentifier.story.desc, for: indexPath) as! StoryTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCellIdentifier.feed.desc, for: indexPath) as! FeedTableViewCell
            return cell
        }
    }
}
