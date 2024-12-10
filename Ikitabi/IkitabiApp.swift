//
//  IkitabiApp.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import SwiftUI
import SwiftData

@main
struct IkitabiApp: App {
    var body: some Scene {
        WindowGroup {
            AccommodationRouter.createModule()
        }
    }
}
