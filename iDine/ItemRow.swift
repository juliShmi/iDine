//
//  ItemRow.swift
//  iDine
//
//  Created by Iuliia Shmitko on 02/06/2024.
//

import SwiftUI

struct ItemRow: View {
    let menuItem: MenuItem
    var body: some View {
        HStack {
            Image(menuItem.thumbnailImage)
            Text(menuItem.name)
        }
    }
}

#Preview {
    ItemRow(menuItem: MenuItem.example)
}
