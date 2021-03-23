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
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform:{ viewModel.fetchUsers(url: URLS.users.rawValue) })
        
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: viewModel.actionBackPage) {
                    Image(systemName: "chevron.left.circle")
                }.disabled(viewModel.isFirsPage)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: viewModel.actionNextPage) {
                    Image(systemName: "chevron.right.circle")
                        .font(.largeTitle)
                }.disabled(viewModel.isLastPage)
            }
        }
    }
}


struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}
