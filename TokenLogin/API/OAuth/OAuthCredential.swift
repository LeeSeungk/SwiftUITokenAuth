//
//  OAuthCredential.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/25.
//

import Foundation
import Alamofire

struct OAuthCredential : AuthenticationCredential {
    let accessToken: String
    
    let refreshToken: String
    
    let expiration: Date
    var requiresRefresh: Bool { Date(timeIntervalSinceNow: 30) > expiration}
    
    
}
