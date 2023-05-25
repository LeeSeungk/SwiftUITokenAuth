//
//  UserDefaultManager.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/25.
//

import Foundation

class UserDefaultsManager {
    enum Key: String, CaseIterable{
        case refreshToken, accessToken
    }
    
    static let shared: UserDefaultsManager = {
        return UserDefaultsManager()
    }()
    
    
    //저장된 모든 데이터 지우기
    func clearAll(){
        print("UserDefaultsManager - clearAll() called")
        Key.allCases.forEach{ UserDefaults.standard.removeObject(forKey: $0.rawValue)}
    }
    
    //토큰들 저장
    func setTokens(accessToekn: String, refreshToken: String){
        print("UserDefaultsManager - setTokens() called")
        UserDefaults.standard.set(accessToekn, forKey: Key.accessToken.rawValue)
        UserDefaults.standard.set(refreshToken, forKey: Key.refreshToken.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    //토큰들 가져오기
    func getTokens() -> TokenData {
        let accessToken = UserDefaults.standard.string(forKey: Key.accessToken.rawValue) ?? ""
        let refreshToken = UserDefaults.standard.string(forKey: Key.refreshToken.rawValue) ?? ""
        return TokenData(access_token: accessToken, refresh_token: refreshToken)
    }
}
