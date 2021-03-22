//
//  ContentView.swift
//  Test task
//
//  Created by Сергей on 19.03.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView{
            
            NavigationView{
                LoginView()
            }
            .tabItem { Image(systemName: "pip.enter") }
            
            NavigationView{
                UsersView()
            }
            .tabItem { Image(systemName: "person.3") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
