//
//  UserView.swift
//  Test task
//
//  Created by Сергей on 28.03.2021.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        
        ZStack {
            TitleView()
           
            VStack {
                Spacer()
                    .frame(height: 100)
                
                ScrollView {
                    LazyVStack {
                        RowUserView(iconName: "heart.fill",
                                    title: "You favourites",
                                    action: {}
                        )
                        
                        RowUserView(iconName: "creditcard.fill",
                                    title: "Payment",
                                    action: {}
                        )
                        
                        RowUserView(iconName: "lifepreserver.fill",
                                    title: "Help",
                                    action: {}
                        )
                        
                        RowUserView(iconName: "banknote.fill",
                                    title: "Promotions",
                                    action: {}
                        )
                        
                        RowUserView(iconName: "gearshape.fill",
                                    title: "Settings",
                                    action: {}
                        )
                        
                    }
                }
            }
        }
    }
}


struct TitleView: View {
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        
        VStack {
            Group {
                ZStack{
                    Color(.systemBackground)
                        .ignoresSafeArea(.all, edges: .top)
                    HStack {
                        Image("UserPhoto")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .clipShape(Circle())
                            .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Samanta Doe")
                            .font(Font.custom("Nunito-Bold", size: 24))
                            .foregroundColor(colorScheme == .dark ? .white : .customTextColor)
                            .padding()
                        Spacer()
                    }.padding()
                }.frame(height: 100)
            }.shadow(radius: 40)
            
            Spacer()
        }
    }
}


struct RowUserView: View {
    @Environment(\.colorScheme) private var colorScheme
    let iconName: String
    let title: String
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action){
            HStack {
                
                LinearGradient(gradient: Gradient(colors: [.customOrange, .customYellow]), startPoint: .leading, endPoint: .trailing)
                    .mask(
                        Image(systemName: iconName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                    )
                    .font(.title)
                    .frame(width: 30)
                    
                Text(title)
                    .font(Font.custom("Nunito-Regular", size: 20))
                    .foregroundColor(colorScheme == .dark ? .white : .customTextColor)
                
                Spacer()
            }
        }.padding()
    }
}

extension Color {
    
    static let customYellow = (Color(red: 254/255, green: 203/255, blue: 106/255))
    static let customOrange = (Color(red: 246/255, green: 161/255, blue: 116/255))
    static let customTextColor = (Color(red: 57/255, green: 57/255, blue: 57/255))
}


struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
            .preferredColorScheme(.dark)
    }
}
