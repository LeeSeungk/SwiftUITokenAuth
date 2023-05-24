//
//  RegisterView.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

//
//  LoginView.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

import Foundation
import SwiftUI


struct RegisterView : View {
    @State var nameInput : String = ""
    @State var emailInput : String = ""
    @State var passwordInput : String = ""
    var body: some View {
        VStack {
            Form{
                Section(header: Text("이름")) {
                    TextField("이름을 입력해주세요", text: $nameInput)
                }
                Section(header: Text("이메일")) {
                    TextField("이메일", text: $emailInput)
                }
                Section(header: Text("비밀번호")) {
                    SecureField("비밀번호", text: $passwordInput)
                    SecureField("비밀번호확인", text: $passwordInput)
                }
                
                Section() {
                    Button(action: {print("회원가입하기")}) {
                        Text("회원가입하기")
                    }
                }
            }
        }.navigationTitle("회원가입")
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
