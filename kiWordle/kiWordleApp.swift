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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
