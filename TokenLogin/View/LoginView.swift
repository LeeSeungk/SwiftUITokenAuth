//
//  LoginView.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

import Foundation
import SwiftUI


struct LoginView : View {
    
    @State var emailInput : String = ""
    @State var passwordInput : String = ""
    var body: some View {
        VStack {
            Form{
                Section(header: Text("로그인 정보")) {
                    TextField("이메일", text: $emailInput).keyboardType(.emailAddress).autocapitalization(.none)
                    SecureField("비밀번호", text: $passwordInput).keyboardType(.default)
                }
                Section {
                    Button(action: {
                        print("로그인 버튼 클릭")
                        
                    }, label: {
                        Text("로그인 하기")})
                }
            }
        }.navigationTitle("로그인 하기")
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
