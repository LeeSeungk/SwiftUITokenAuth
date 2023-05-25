//
//  ApiClient.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

import Foundation
import Alamofire

// api 호출 클라이언트
final class ApiClient { //다른 쪽에서 상속하지 않도록 final로 선언
    static let shared = ApiClient() //싱글톤
    
    static let BASE_URL = "https://phplaravel-574671-2229990.cloudwaysapps.com/api"
    
    let interceptors = Interceptor(interceptors: [
    BaseInterceptor() // application/json
    ])
    
    let monitors = [ApiLogger()] as [EventMonitor]
    
    var session: Session
    
    init() {
        print("ApiClient - init() called")
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
}
