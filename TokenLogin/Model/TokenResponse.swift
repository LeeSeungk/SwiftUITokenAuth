//
//  TokenResponse.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/26.
//

import Foundation

struct TokenResponse: Codable{
    let message: String
    let token: TokenData
}
