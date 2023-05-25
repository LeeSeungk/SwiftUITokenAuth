//
//  RegisterView.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//


import Foundation
import SwiftUI


struct RegisterView : View {
    
    @EnvironmentObject var userVM : UserVM
    @Environment(\.dismiss) var dismiss
    @State fileprivate var shouldShowAlert : Bool = false
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
                    Button(action: {
                        print("회원가입 버튼 클릭")
                        userVM.register(name: nameInput, email: emailInput, password: passwordInput)
                        
                    }) {
                        Text("회원가입하기")
                    }
                }
            }
            .onReceive(userVM.registrationSuccess, perform: {
                print("RegisterView - registrationSuccess() called")
                self.shouldShowAlert = true
            })
            .alert("회원가입이 완료되었습니다", isPresented: $shouldShowAlert) {
                Button("확인",role: .cancel){
                    self.dismiss()
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
