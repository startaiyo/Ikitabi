//
//  ContentView.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        Text("hogemaru")
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
