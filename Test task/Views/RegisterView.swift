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
        
        var body: some View {
            
            VStack{
                
                Image(colorScheme == .dark ? "logoForDarkTheme" : "logoForLightTheme")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.size.width * 0.5)
                
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
//                //            .frame(height: 90)
//
//                HStack{
//                    Spacer()
//                    Button("Forgot password?") {}
//                }.padding(.bottom, 30)
                
                Button("Register", action: registrationAction)
                    .buttonStyle(CustomButtonStyle())
                    .disabled(!isOnLiginButton)

//                Button(action: {print("press facebookLogo")}) {
//                    HStack{
//                        Image("facebookLogo")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .foregroundColor(.blue)
//                            .frame(width: 16, height: 16)
//                        Text("Log in with Facebook")
//                            .bold()
//                    }
//                }
                
//                LabelledDivider()
                
                Spacer()
                
            }
            .padding()
            
        }
}

    
    
    



extension RegisterView {
    var isOnLiginButton: Bool {
        email != "" && password != ""
    }
    
    private func registrationAction() {
        NetworkManager.shared.register(username: email, password: password)
    }
    
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}




