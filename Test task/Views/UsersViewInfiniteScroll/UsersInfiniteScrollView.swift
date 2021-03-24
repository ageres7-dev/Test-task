//
//  UsersViewInfiniteScroll.swift
//  Test task
//
//  Created by Сергей on 23.03.2021.
//

import SwiftUI

struct UsersInfiniteScrollView: View {
    @StateObject var viewModel = UsersInfiniteScrollViewModel()
    @State private var nextIndex = 1
    
    var body: some View {
        
        List(viewModel.users.indices, id: \.self) { userIndex in
            let user = viewModel.users[userIndex]
            RowView(user: user)
                .onAppear {
                    if userIndex == viewModel.users.count - 2 {
                        viewModel.actionLoadPage()
                    }
                }
        }
        .navigationTitle("Users")
//        .navigationBarBackButtonHidden(true)
        .onAppear(perform:{ viewModel.actionLoadPage() })
    
    }
}



struct RowView: View {
    let user: User
    
    var body: some View {
        HStack{
           
            RemoteImage(url: user.avatar ?? "")
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 60, height: 60)
            Text("\(user.firstName ?? "") \(user.lastName ?? "")")
        }
    }
}

struct UsersViewInfiniteScroll_Previews: PreviewProvider {
    static var previews: some View {
        UsersInfiniteScrollView()
    }
}
