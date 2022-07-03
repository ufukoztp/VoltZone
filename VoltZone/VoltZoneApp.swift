//
//  VoltZoneApp.swift
//  VoltZone
//
//  Created by Ufuk Öztop on 21.06.2022.
//

import SwiftUI
import FirebaseCore

@main
struct VoltZoneApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
