//
//  LoginView.swift
//  Test task
//
//  Created by Сергей on 19.03.2021.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) private var colorScheme
    @Binding var showUsers: Bool
    @State private var email = ""
    @State private var password = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isLoading = false
    
    var body: some View {
        ScrollView{
            VStack{
                Spacer()
                Image(colorScheme == .dark ? "logoForDarkTheme" : "logoForLightTheme")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 60)
                    .padding()
               
                LiginTextField(email: $email, password: $password)

                ForgotPassword()
                    .padding(.bottom, 30)
                
                Button(action: loginAction) {
                    if isLoading{
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .setCustomStyleButton(disabledStyle: true)
                            .padding(.bottom, 4)
                    } else {
                        Text("Log in")
                            .setCustomStyleButton(disabledStyle: !isOnLiginButton)
                    }
                }
                .disabled(!isOnLiginButton)
                .alert(isPresented: $showAlert) { alert }
                VStack{
                    FacebookButton()
                        .padding(.top, 20)
                    
//                    Button("hack enter", action: {showUsers.toggle()})
                    LabelledDivider()
                        .padding(.vertical, 20)
                    
                    HStack{
                        Text("Don't have an account?")
                        NavigationLink("Sign Up.", destination: RegisterView(showUsers: $showUsers))
                    }
                }

                Spacer()
            }
            .padding()
            .navigationTitle("")
            .navigationBarHidden(true)
        }
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
        NetworkManager.shared.login(username: email, password: password) { successful, response in
            
            if successful {
                withAnimation() {
                    showUsers.toggle()
                }
            } else {
                isLoading = false
                alertMessage = response.error ?? ""
                showAlert = true
                password = ""
            }

        }
    }
}


struct ForgotPassword: View {
    @State private var showingAlert = false
    
    var body: some View {
        
        HStack{
            Spacer()
            
            Button("Forgot password?") {
                showingAlert.toggle()
            }
            .alert(isPresented: $showingAlert) {
                Alert(
                    title: Text("Login"),message: Text("""
                                    email: eve.holt@reqres.in
                                    password: cityslicka"
                                    """)
                )
            }
        }
    }
}


struct LabelledDivider: View {
    var body: some View {
        HStack {
            line
            Text("OR")
                .foregroundColor(.gray)
                .bold()
            line
        }
    }

    var line: some View {
        VStack { Divider().foregroundColor(.gray) }
            .padding()
    }
}


struct LiginTextField: View {
    @Binding var email: String
    @Binding var password: String
    var body: some View {
        Group{
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
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
    }
}

struct FacebookButton: View {
    var body: some View {
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
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showUsers: .constant(false))
            .preferredColorScheme(.light)
    }
}

struct LabelledDivider_Previews: PreviewProvider {
    static var previews: some View {
        LabelledDivider()
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
