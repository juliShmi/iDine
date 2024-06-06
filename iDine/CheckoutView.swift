//
//  CheckoutView.swift
//  iDine
//
//  Created by Iuliia Shmitko on 06/06/2024.
//

import SwiftUI

struct CheckoutView: View {
    
    let paymentTypes:[String] = ["Cash", "Credit card", "iDine Points"]
    @State var payBy = "Card"
    
    var body: some View {
        VStack {
            Section {
                Picker("How do you want to pay", selection: $payBy) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
