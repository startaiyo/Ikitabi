//
//  AccommodationRouterProtocol.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/08.
//

import SwiftUI

protocol AccommodationRouterProtocol: AnyObject {
    var navigationPath: NavigationPath { get }
    associatedtype ContentView = View
    static func createModule() -> ContentView
    func navigation(to view: any Hashable)
    func back()
}
