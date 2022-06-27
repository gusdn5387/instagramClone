//
//  FeedService.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/26.
//

import Foundation
import Alamofire

class FeedService {
    // MARK: 피드 데이터 가져오기
    func getFeedData(parameters: FeedInput, completion: @escaping ([Feed]) -> Void) {
        let url = "https://api.thecatapi.com/v1/images/search"
        AF.request(url, method: .get, parameters: parameters)
            .responseDecodable(of: [Feed].self) { response in
                switch response.result {
                case .success:
                    guard let data = response.value else { return }
                    print(data)
                    completion(data)
                case let .failure(error):
                    print(error.localizedDescription)
                }
            }
    }
}
