//
//  FasctsApp.swift
//  Fascts
//
//  Created by Giga Khizanishvili on 13.09.22.
//

import SwiftUI

@main
struct FasctsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
