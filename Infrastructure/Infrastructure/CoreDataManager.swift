//
//  CoreDataManager.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import CoreData
import Domain

public class CoreDataManager {

    let bundleIdentifier: String  = "Ceiba.Infrastructure"
    let xcdatamodeld: String = "ParkingCoreData"
    
    lazy var persistentContainer: NSPersistentContainer = {
        let messageKitBundle = Bundle(identifier: bundleIdentifier)
        let modelURL = messageKitBundle!.url(forResource: xcdatamodeld, withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        let container = NSPersistentContainer(name: xcdatamodeld, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { (storeDescription, error) in
            if let err = error{
                fatalError("Loading of store failed:\(err)")
            }
        }
        return container
    }()
    
    func getFetchCurrentParking() throws -> [ParkingShiftCoreEntity] {
        return try getFetch(withPredicate: "departureDate == nil")
    }
    
    func getFetchHistoricalParking() throws -> [ParkingShiftCoreEntity] {
        return try getFetch(withPredicate: "departureDate != nil")
    }
    
    private func getFetch(withPredicate predicate: String) throws -> [ParkingShiftCoreEntity]  {
        let context = persistentContainer.viewContext
        let fetchRequest = predicate == "" ? ParkingShiftCoreEntity.fetchRequest():ParkingShiftCoreEntity.fetchRequest(withPredicate: predicate)

        do{
            let parkings = try context.fetch(fetchRequest)
            for (index, parking) in parkings.enumerated() {
                print("Parking \(index) - Admission date: \(parking.admissionDate?.description ?? "N/A") - Departure date:  \(parking.departureDate?.description ?? "N/A") - Plate car:\(parking.vehicle?.plate ?? "N/A")")
            }
            return parkings
        } catch {
            throw InfrastructureErrors.ErrorFetchParkings()
        }
    }
}
