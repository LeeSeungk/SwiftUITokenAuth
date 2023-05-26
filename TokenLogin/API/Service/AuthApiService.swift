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
    
    //회원가입
    static func register(name: String,email: String, password: String) -> AnyPublisher<UserData,AFError>{
        print("AuthApiService - register() called")
        
        return ApiClient.shared.session
            .request(AuthRouter.register(name: name, email: email, password: password))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .map{ receivedValue in
                //받은 토큰 정보 어딘가에 영구 저장
                // userdefaults, keychain
                UserDefaultsManager.shared.setTokens(accessToekn: receivedValue.token.access_token, refreshToken: receivedValue.token.refresh_token)
                return receivedValue.user
            }.eraseToAnyPublisher()
    }
    
    //로그인
    static func login(email: String, password: String) -> AnyPublisher<UserData,AFError>{
        print("AuthApiService - login() called")
        
        return ApiClient.shared.session
            .request(AuthRouter.login(email: email, password: password))
            .publishDecodable(type: AuthResponse.self)
            .value()
            .map{ receivedValue in
                //받은 토큰 정보 어딘가에 영구 저장
                // userdefaults, keychain
                UserDefaultsManager.shared.setTokens(accessToekn: receivedValue.token.access_token, refreshToken: receivedValue.token.refresh_token)
                return receivedValue.user
            }.eraseToAnyPublisher()
    }
}

