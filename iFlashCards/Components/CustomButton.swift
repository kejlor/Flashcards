//
//  CustomButton.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 09/07/2022.
//

import SwiftUI

struct CustomButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Przycisk") {
            print("Button pressed")
        }
        .buttonStyle(CustomButton())
    }
}
