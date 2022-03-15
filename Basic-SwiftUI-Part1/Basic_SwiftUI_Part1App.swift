//
//  Basic_SwiftUI_Part1App.swift
//  Basic-SwiftUI-Part1
//
//  Created by Chondro Satrio Wibowo on 15/03/22.
//

import SwiftUI

@main
struct Basic_SwiftUI_Part1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(guess: RGB())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
