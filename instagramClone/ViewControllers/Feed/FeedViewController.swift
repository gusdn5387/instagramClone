//
//  FeedViewController.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/24.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FeedService().getFeedData(parameters: FeedInput(limit: 10, page: 0))
    }
}
