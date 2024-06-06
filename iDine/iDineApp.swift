//
//  iDineApp.swift
//  iDine
//
//  Created by Iuliia Shmitko on 01/06/2024.
//

import SwiftUI

@main
struct iDineApp: App {
   @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.environmentObject(order)
    }
}
