//
//  ItemRow.swift
//  iDine
//
//  Created by Iuliia Shmitko on 02/06/2024.
//

import SwiftUI

struct ItemRow: View {
    let menuItem: MenuItem
    
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    
    var body: some View {
        HStack {
            Image(menuItem.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.yellow, lineWidth: 2))
            VStack(alignment:.leading) {
                Text(menuItem.name)
                    .font(.headline)
                Text("\(menuItem.price)$")
            }
            Spacer()
            ForEach(menuItem.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction, default: .black])
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ItemRow(menuItem: MenuItem.example)
}
