//
//  TokenData.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

import Foundation




struct TokenData: Codable {
    let tokenType: String
    let expiresIn: Int
    let accessToken, refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
