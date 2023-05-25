//
//  TokenData.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

import Foundation




struct TokenData: Codable {
    let token_type: String = ""
    let expires_in: Int = 0
    let access_token, refresh_token: String
    
//    enum CodingKeys: String, CodingKey {
//        case tokenType = "token_type"
//        case expiresIn = "expires_in"
//        case accessToken = "access_token"
//        case refreshToken = "refresh_token"
//    }
}
