//
//  CardRevision.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 26/05/2022.
//

import SwiftUI

struct CardRevision: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(Color("Gray"))
                        .frame(width: geometry.size.width,
                               height: geometry.size.height)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .padding()

    }
}

struct CardRevision_Previews: PreviewProvider {
    static var previews: some View {
        CardRevision()
    }
}
