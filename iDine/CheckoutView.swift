//
//  CheckoutView.swift
//  iDine
//
//  Created by Iuliia Shmitko on 06/06/2024.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order:Order
    
    let paymentTypes:[String] = ["Cash", "Credit card", "iDine Points"]
    @State var payBy = "Card"
    
    @State private var addLoyaltyDetails = false
    @State private var loyaltyCard = ""
    
    let tips = [10, 15, 20, 25, 0]
    @State private var tipAmount = 15
    
    var showTotalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    @State private var showingConfirmationAlert = false
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay", selection: $payBy) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
                Toggle("Add loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter loyalty card number", text: $loyaltyCard)
                }
            }
            Section("Add tips?") {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(tips, id: \.self) {
                        Text("\($0)%")
                    }
                }.pickerStyle(.segmented)
            }
            Section("Total: \(showTotalPrice)") {
                Button("Confirm order") {
                    showingConfirmationAlert.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order confirmed", isPresented: $showingConfirmationAlert) {
            //add buttons here
        } message: {
            Text("Your total price is \(showTotalPrice)")
        }
            
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
