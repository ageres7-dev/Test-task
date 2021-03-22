//
//  UsersView.swift
//  Test task
//
//  Created by Сергей on 22.03.2021.
//

import SwiftUI

struct UsersView: View {
    @StateObject var viewModel = UsersViewModel()
    
    var body: some View {
        ZStack{
            List(viewModel.users, id: \.self) { user in
                HStack{
                    RemoteImage(url: user.avatar ?? "")
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 60, height: 60)
                    Text("\(user.firstName ?? "") \(user.lastName ?? "")")
                }
            }
            .navigationTitle("Users")
            .navigationBarBackButtonHidden(true)
            .onAppear(perform: viewModel.fetchUsers)
            
            
            
            VStack{
                Spacer()
                HStack{
                    Button(action: {}) {
                        Image(systemName: "chevron.left.circle")
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "chevron.right.circle")
                    }
                }
                .font(.largeTitle)
                .padding()
            }
        }
    }
    
}

//extension {
//    var avatar: Image = Image("")
//}







struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
