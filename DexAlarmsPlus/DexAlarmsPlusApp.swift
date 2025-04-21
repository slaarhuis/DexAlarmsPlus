//
//  DexAlarmsPlusApp.swift
//  DexAlarmsPlus
//
//  Created by Stephan Laarhuis on 21/04/2025.
//

import SwiftUI

@main
struct DexAlarmsPlusApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
