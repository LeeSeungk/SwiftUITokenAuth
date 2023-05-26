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
    
    @Published var users : [UserData] = []
    
    var registrationSuccess = PassthroughSubject<(),Never>()
    
    var loginSuccess = PassthroughSubject<(), Never>()
    
    
    /// 회원가입 하기
    func register(name: String, email: String, password: String){
        print("UserVM: register() called")
        AuthApiService.register(name: name, email: email, password: password)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                self.loggedInUser = receivedUser
                self.registrationSuccess.send()
            }.store(in: &subscription)

    }
    
    /// 로그인 하기
    func login(email: String, password: String){
        print("UserVM: login() called")
        AuthApiService.login(email: email, password: password)
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                self.loggedInUser = receivedUser
                self.loginSuccess.send()
            }.store(in: &subscription)

    }
    
    //현재 사용자 정보 가져오기
    func fetchCurrentUserInfo(){
        print("UserVM - fetchCurrentUserInfo() called")
        UserApiService.fetchCurrentUserInfo()
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM completion: \(completion)")
            } receiveValue: { (receivedUser: UserData) in
                self.loggedInUser = receivedUser
            }.store(in: &subscription)
    }
    
    
    //모든 사용자 정보 가져오기
    func fetchUsers(){
        print("UserVM - fetchfetchUsers() called")
        UserApiService.fetchUsers()
            .sink { (completion: Subscribers.Completion<AFError>) in
                print("UserVM fetchUsers completion: \(completion)")
            } receiveValue: { (`fetchedUsers`: [UserData]) in
                print("UserVM fetchUsers fetchedUsers.count: \(fetchedUsers.count)")
                self.users = fetchedUsers
            }.store(in: &subscription)
    }
}
