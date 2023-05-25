//
//  LoginView.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

import Foundation
import SwiftUI


struct LoginView : View {
    
    @EnvironmentObject var userVM : UserVM
    @Environment(\.dismiss) var dismiss
    @State fileprivate var shouldShowAlert : Bool = false
    
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
                        userVM.login(email: emailInput, password: passwordInput)
                    }, label: {
                        Text("로그인 하기")
                        
                    })
                }
            }
            .onReceive(userVM.loginSuccess, perform: {
                print("LoginView - LoginSuccess() called")
                self.shouldShowAlert = true
            })
            .alert("로그인이 완료되었습니다", isPresented: $shouldShowAlert) {
                Button("확인",role: .cancel){
                    self.dismiss()
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
