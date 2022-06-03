//
//  kiWordleApp.swift
//  kiWordle
//
//  Created by Harold Marash on 6/1/22.
//

import SwiftUI

@main
struct kiWordleApp: App {
    let persistenceController = PersistenceController.shared

    @StateObject var game = kWordlePlayModel()
    
    var body: some Scene {
        WindowGroup {
            OpeningView()
            //ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(game)
        }
    }
}
