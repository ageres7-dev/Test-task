//
//  RegisterView.swift
//  Test task
//
//  Created by Сергей on 20.03.2021.
//

import SwiftUI


    struct RegisterView: View {
        @Environment(\.colorScheme) private var colorScheme
        @State var email = ""
        @State var password = ""
        @State var openUsersView = false
        @State private var alertMessage = ""
        @State private var isLoading = false
        @State private var showAlert = false
        
        var body: some View {
            
            VStack{
                Image(colorScheme == .dark ? "logoForDarkTheme" : "logoForLightTheme")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 60)
                
                Group{
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
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
                
                Button(action: registrationAction) {
                    if isLoading{
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .setCustomStyleButton(disabledStyle: true)
                        
                    } else {
                        Text("Register")
                            .setCustomStyleButton(disabledStyle: !isOnRegisterButton)
                    }
                }
                .disabled(!isOnRegisterButton)
                .padding(.top, 30)
                
                Spacer()
                
            }
            .padding()
            .alert(isPresented: $showAlert) { alert }
        }
}

extension RegisterView {
    
    private var alert: Alert {
        Alert(
            title: Text("Error"),
            message: Text(alertMessage)
        )
    }
    
    private var isOnRegisterButton: Bool {
        email != "" && password != ""
    }
    
    private func registrationAction() {
        isLoading.toggle()
        NetworkManager.shared.register(username: email, password: password) { successful, response in
            isLoading.toggle()
            if successful {
                openUsersView.toggle()
            } else {
                alertMessage = response.error ?? ""
                showAlert.toggle()
                password = ""
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}




