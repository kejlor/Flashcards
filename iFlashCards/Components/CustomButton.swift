//
//  CustomButton.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 09/07/2022.
//

import SwiftUI

struct CustomButton: View {
    @Environment(\.colorScheme) var colorScheme
    var text: String
    var action: (() -> Void)
    var body: some View {
        Button(action: action) {
            Text(text)
                .fontWeight(.semibold)
                .padding()
                .padding(.horizontal, 20)
                .background(
                    colorScheme == .dark ? Color.white.cornerRadius(10).shadow(radius: 10) : Color.black.cornerRadius(10).shadow(radius: 10)
                )
        }
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Test") {
            print("test")
        }
    }
}
