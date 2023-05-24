//
//  UserVM.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

import Foundation
import Alamofire
import Combine

class UserVM: ObservableObject {
    
    //MARK: Properties
    var subscription = Set<AnyCancellable>()
    
    @Published var loggedInUser: UserData? = nil
    
    
    /// 회원가입 하기
    func register(name: String, email: String, password: String){
        print("UserVM: register() called")
        AuthApiService.register(name: name, email: email, password: password)
            .sink { completion in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                self.loggedInUser = receivedUser
            }.store(in: &subscription)

    }
}
