//
//  UsersTabView.swift
//  Test task
//
//  Created by Сергей on 23.03.2021.
//

import SwiftUI

struct UsersTabView: View {
    var body: some View {
        
        TabView {
            NavigationView {
                UsersView()
            }
            .tabItem { Label("Users", systemImage: "person.3") }
            
            NavigationView {
                UsersInfiniteScrollView()
            }
            .tabItem { Label("Infinite Scroll", systemImage: "infinity.circle") }
            
            UserView()
                .tabItem { Label("User", systemImage: "person.fill") }
            
            FilterView()
                .tabItem { Label("Filter", systemImage: "camera.filters") }
            
        }
    }
}

struct UsersTabView_Previews: PreviewProvider {
    static var previews: some View {
        UsersTabView()
    }
}
