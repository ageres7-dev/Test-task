//
//  FilterView.swift
//  Test task
//
//  Created by Сергей on 28.03.2021.
//

import SwiftUI

struct FilterView: View {
    @State private var review: Int = 5
    @State private var star = ""
    @State private var type = ""
    @State private var meals = ""
    @State private var breakfastIncludet = true
    @State private var deals = false
    @State private var onlyShowAvailable = false
    
    let reviewScore = [1, 2, 3, 4, 5]
    let stars = ["⭐️", "⭐️⭐️", "⭐️⭐️⭐️", "⭐️⭐️⭐️⭐️", "⭐️⭐️⭐️⭐️⭐️"]
    let typesHotel = [
        "Hotels", "Motels", "Apartments",
        "Hostels", "Vacation Homes", "Bed and Breakfasts",
        "Resorts", "Villas", "Homestays",
        "Campgrounds", "Guesthouses"
    ]
    let typeMeals = ["Kitchen facilities", "Breakfast Included"]
    
    var body: some View {
        NavigationView {
            Form {
                
                Picker("Stars rating", selection: $star) {
                    ForEach(stars, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Review score", selection: $review) {
                    ForEach(reviewScore, id: \.self) {
                        Text("\($0)")
                    }
                }
                Picker("Meals", selection: $meals) {
                    ForEach(typeMeals, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Type", selection: $type) {
                    ForEach(typesHotel, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(DefaultPickerStyle())
                
                Toggle("Breakfast Includet", isOn: $breakfastIncludet)
                
                Toggle("Deals", isOn: $deals)
                
                Toggle("Only show available", isOn: $onlyShowAvailable)
                
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Reset")
                    }
                }
            }
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
