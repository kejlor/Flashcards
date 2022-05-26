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
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Wróć do domu")
                    .frame(width: 200, height: 60)
                    .background(Color.gray)
                    .foregroundColor(Color.black)
            }
            
        }
    }
}

struct RevisionAlertView_Previews: PreviewProvider {
    static var previews: some View {
        RevisionAlertView(isShowingAlert: .constant(true))
    }
}