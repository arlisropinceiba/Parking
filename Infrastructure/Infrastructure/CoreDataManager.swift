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
        return try getFetch(withPredicate: NSPredicate(format: "departureDate == nil"))
    }

    func getFetchHistoricalParking() throws -> [ParkingShiftCoreEntity] {
        return try getFetch(withPredicate: NSPredicate(format: "departureDate != nil"))
    }
    
    func getFetchById(_ uid: UUID) throws -> [ParkingShiftCoreEntity] {
        return try getFetch(withPredicate: NSPredicate(format: "uid == %@", uid as CVarArg))
    }
    
    private func getFetch(withPredicate predicate: NSPredicate) throws -> [ParkingShiftCoreEntity]  {
        let context = persistentContainer.viewContext
        let fetchRequest = ParkingShiftCoreEntity.fetchRequest(withPredicate: predicate)

        do{
            let parkings = try context.fetch(fetchRequest)
            for (index, parking) in parkings.enumerated() {
                print("Parking \(index) - Id: \(String(describing: parking.uid)) - Admission date: \(parking.admissonDate?.description ?? "N/A") - Departure date:  \(parking.departureDate?.description ?? "N/A") - Plate vehicle: \(parking.vehicle?.plate ?? "N/A") - Cylinder capacity: \((parking.vehicle as? MotorcycleCoreEntity)?.cylinderCapacity ?? 0)")
            }
            return parkings
        } catch {
            throw InfrastructureErrors.ErrorFetchParkings()
        }
    }

}
