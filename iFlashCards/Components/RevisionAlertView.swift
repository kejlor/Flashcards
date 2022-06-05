//
//  RevisionAlertView.swift
//  iFlashCards
//
//  Created by Bartosz Wojtkowiak on 25/04/2022.
//

import SwiftUI

struct RevisionAlertView: View {
    @Binding var isShowingAlert: Bool
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Text("Udało Ci się ukończyć test")
                .background(Color.gray)
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Wróć")
                    .frame(width: 200, height: 60)
                    .background(Color.gray)
            }
        }
    }
}

struct RevisionAlertView_Previews: PreviewProvider {
    static var previews: some View {
        RevisionAlertView(isShowingAlert: .constant(true))
    }
}
