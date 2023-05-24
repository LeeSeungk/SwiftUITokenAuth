//
//  AuthResponse.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

import Foundation

struct AuthResponse: Codable {
    var user: UserData
    var token: TokenData
    
    enum CodingKeys: String, CodingKey {
        case token
        case user
    }
}
