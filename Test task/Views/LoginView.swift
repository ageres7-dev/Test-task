//
//  LoginView.swift
//  Test task
//
//  Created by Сергей on 19.03.2021.
//

import SwiftUI

struct LoginView: View {
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
            //            .frame(height: 90)
            
            HStack{
                Spacer()
                Button("Forgot password?") {}
            }.padding(.bottom, 30)
            
            Button("Log in", action: {print("press log in")})
                .buttonStyle(CustomButtonStyle())
                .disabled(!isOnLiginButton)

            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
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
            
            Spacer()
            
        }.padding()
    }
}


extension LoginView {
    var isOnLiginButton: Bool {
        true
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
