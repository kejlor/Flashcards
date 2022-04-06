//
//  Card.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 04/04/2022.
//

import SwiftUI

struct Card: View {
    var axis:(CGFloat,CGFloat,CGFloat) = (1.0,0.0,0.0)
    var isFlipped: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color("Gray"))
        }
        .rotation3DEffect(Angle.degrees(isFlipped ? 0 : 180), axis: axis)
        .frame(width: 175, height: 220)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(isFlipped: false)
    }
}
