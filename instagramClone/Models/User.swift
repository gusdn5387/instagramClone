//
//  User.swift
//  instagramClone
//
//  Created by 박현우 on 2022/06/24.
//

import Foundation

// MARK: - Entity
struct UserInfo {
    let userName, password: String
    let phone, email: String?
}

// MARK: - DataModel
class UserModel {
    static let shared = UserModel()
    
    // 회원가입용 임시 저장 데이터
    public var tempUserName: String?
    public var tempPassword: String?
    public var tempPhone: String?
    public var tempEmail: String?
    
    // 회원 정보 (DummyData)
    public var userInfo: UserInfo?
    
    // MARK: 회원가입용 임시 저장 데이터 초기화
    public func tempReset() {
        self.tempUserName = nil
        self.tempPassword = nil
        self.tempPhone = nil
        self.tempEmail = nil
    }
}
