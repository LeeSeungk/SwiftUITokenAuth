//
//  AuthApiService.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

import Foundation
import Alamofire
import Combine

//인증 관련 api 호출
enum AuthApiService {
//    static func login(email: String, password: String) ->
    
    static func register(name: String,email: String, password: String) -> AnyPublisher<UserData,AFError>{
        print("AuthApiService - register() called")
        
        return ApiClient.shared.session
            .request(AuthRouter.register(name: name, email: email, password: password))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .map{ receivedValue in
                return receivedValue.user
            }.eraseToAnyPublisher()
    }
}
