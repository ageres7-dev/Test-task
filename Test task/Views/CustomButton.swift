//
//  CustomButton.swift
//  Test task
//
//  Created by Сергей on 21.03.2021.
//

import SwiftUI

//struct CustomButton: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct CustomButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomButton()
//    }
//}


struct CustomStyleButton: ViewModifier {
    let disabledStyle: Bool
    func body(content: Content) -> some View {
        content
//            .font(.title3)
//            .foregroundColor(disabledStyle ? Color.white.opacity(0.8) : .white)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(disabledStyle ? Color.blue.opacity(0.4) : .blue)
            .cornerRadius(10)
    }
}




extension View {
    func setCustomStyleButton(disabledStyle: Bool = false) -> some View {
        self.modifier(
            CustomStyleButton(disabledStyle: disabledStyle)
        )
    }
}
