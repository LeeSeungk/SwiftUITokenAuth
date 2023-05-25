//
//  UserApiService.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/25.
//

import Foundation
import Alamofire
import Combine

//사용자 관련 api 호출
//현재 사용자 정보, 모든 사용자 정보 가져오기
enum UserApiService {

    //현재사용자 정보
    static func  fetchCurrentUserInfo() -> AnyPublisher<UserData,AFError>{
        print("AuthApiService - register() called")
        
        return ApiClient.shared.session
            .request(UserRouter.fetchCurrentUserInfo)
            .publishDecodable(type: UserInfoResponse.self)
            .value()
            .map{ receivedValue in
                return receivedValue.user
            }.eraseToAnyPublisher()
    }
    
}
