//
//  Card.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/04/2022.
//

import SwiftUI

struct Card: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color("Gray"))
        }
        .frame(width: 175, height: 220)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card()
    }
}