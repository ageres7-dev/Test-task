//
//  ContentView.swift
//  Test task
//
//  Created by Сергей on 19.03.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showUsers = false
    var body: some View {
        
        if showUsers {
            UsersTabView()
                .opacity(showUsers ? 1 : 0)
        } else {
            NavigationView{
                LoginView(showUsers: $showUsers)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
