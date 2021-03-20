//
//  LoginView.swift
//  Test task
//
//  Created by Сергей on 19.03.2021.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var email = ""
    @State private var password = ""
    @State private var openNextView = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoading = false
    
    
    var body: some View {
        
        VStack{
            
            Image(colorScheme == .dark ? "logoForDarkTheme" : "logoForLightTheme")
                .resizable()
                .aspectRatio(contentMode: .fit)
//                .frame(width: UIScreen.main.bounds.size.width * 0.5)
                .frame(height: 60)
            
            Group{
                TextField("Email", text: $email)
                SecureField("Password", text: $password)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.gray)
                    .opacity(0.1)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray.opacity(0.8), lineWidth: 0.5)
            )
            .padding(.vertical, 4)
            //            .frame(height: 90)
            
            HStack{
                Spacer()
                Button("Forgot password?") {}
            }.padding(.bottom, 30)
            
//            Button("Log in", action: loginAction)
//                .buttonStyle(CustomButtonStyle())
//                .disabled(!isOnLiginButton)
            
            Button(action: loginAction) {
                if isLoading{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
//                        .font(.body)
                        .setCustomStyleButton(disabledStyle: true)
                        .padding(.bottom, 4)
                } else {
                    Text("Log in")
                        .setCustomStyleButton(disabledStyle: !isOnLiginButton)
                }
            
                
                
                
            }.disabled(!isOnLiginButton)

            Button(action: {print("press facebookLogo")}) {
                HStack{
                    Image("facebookLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 16, height: 16)
                    Text("Log in with Facebook")
                        .bold()
                }
            }
            
            LabelledDivider()
            
            HStack{
                Text("Don't have an account?")
                
                NavigationLink("Sign Up.", destination: RegisterView())
                
            }
            
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("")
        .alert(isPresented: $showAlert) { alert }
    }
}


extension LoginView {
    
    private var alert: Alert {
        Alert(
            title: Text("Error"),
            message: Text(alertMessage)
        )
    }
    
    
    private var isOnLiginButton: Bool {
        email != "" && password != ""
    }
    
    private func loginAction() {
        isLoading.toggle()
        NetworkManager.shared.login(username: email, password: password) { (successful, response) in
            isLoading.toggle()
            if successful {
                openNextView.toggle()
            } else {
                alertMessage = response.error ?? ""
                showAlert.toggle()
                password = ""
            }
            
        }
    }
    
    
}





struct LabelledDivider: View {
    var body: some View {
        HStack {
            line
            Text("OR").foregroundColor(.gray)
            line
        }
    }

    var line: some View {
        VStack { Divider().foregroundColor(.gray) }
            .padding()
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.light)
    }
}
