//
//  ContentView.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack(spacing: 10) {
                Spacer(minLength: 100)
                Image(systemName: "lock.shield.fill")
                    .font(.system(size: 160))
                Spacer()
                    .padding()
                NavigationLink(destination: LoginView(), label: {
                    HStack() {
                        Spacer()
                        Text("로그인 하러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                NavigationLink(destination: RegisterView(), label: {
                    HStack {
                        Spacer()
                        Text("회원가입 하러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                Spacer().frame(height: 30)
                NavigationLink(destination: ProfileView(), label: {
                    HStack {
                        Spacer()
                        Text("내 프로필 보러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                NavigationLink(destination: UserListView(), label: {
                    HStack {
                        Spacer()
                        Text("사용자 목록 보러가기")
                        Spacer()
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
                })
                Spacer()
                Spacer()
            }
            .padding()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
