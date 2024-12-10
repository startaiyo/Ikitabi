//
//  AccommodationRouterProtocol.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import SwiftUI

protocol AccommodationRouterProtocol {
    associatedtype ContentView = View
    static func createModule() -> ContentView
}
