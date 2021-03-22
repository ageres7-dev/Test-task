//
//  CustomButton.swift
//  Test task
//
//  Created by Сергей on 21.03.2021.
//

import SwiftUI

struct CustomStyleButton: ViewModifier {
    let disabledStyle: Bool
    func body(content: Content) -> some View {
        content

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
