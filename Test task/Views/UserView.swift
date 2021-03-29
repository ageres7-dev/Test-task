//
//  UserView.swift
//  Test task
//
//  Created by Сергей on 26.03.2021.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        NavigationView {
            
            List {
                Text("Mark Mark")
                Text("Mark Mark")
                Text("Mark Mark")
                
            }
            .navigationBarTitleDisplayMode(.large)
//            .navigationBarTitle("Samanta Doe")
//            .navigationTitle("dddd")
            
            .toolbar {
                ToolbarItem(placement: .principal) {

                    Text("Samanta Doe")
                        .font(.largeTitle)
                        .bold()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("UserPhoto")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
//                        .padding()
                }
                
//                ToolbarItem(placement: .principal) {
//                    TitleView()
//                }
                
                
            }
        }
    }
}





struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
