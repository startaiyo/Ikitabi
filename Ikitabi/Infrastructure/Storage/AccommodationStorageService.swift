//
//  AccommodationStorageService.swift
//  Ikitabi
//
//  Created by Shotaro Doi on 2024/12/31.
//

import SwiftData

final class AccommodationStorageService: AccommodationStorageServiceProtocol {
    // MARK: Private Properties
    private var container: ModelContainer?
    private var context: ModelContext?

    init() {
        do {
            let schema = Schema([Accommodation.self])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            container = try ModelContainer(for: schema, configurations: modelConfiguration)
            guard let container else { return }
            context = ModelContext(container)
        } catch {
            print(error)
        }
    }

    func fetchAccommodations(hotelNo: Int? = nil) -> [Accommodation] {
        let accommodations = (try? context?.fetch(FetchDescriptor<Accommodation>())) ?? []
        if let hotelNo {
            return accommodations.filter { $0.hotelNo == hotelNo }
        } else {
            return accommodations
        }
    }
    
    func insertAccommodation(_ accommodation: Accommodation) {
        context?.insert(accommodation)
        try? context?.save()
    }

    func deleteAccommodation(_ accommodation: Accommodation) {
        context?.delete(accommodation)
        try? context?.save()
    }

    func updateAccommodation() {
        try? context?.save()
    }
}
