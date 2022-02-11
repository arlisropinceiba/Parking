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
        let messageKitBundle = Bundle(identifier: self.bundleIdentifier)
        let modelURL = messageKitBundle!.url(forResource: self.xcdatamodeld, withExtension: "xcdatamodeld")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        let container = NSPersistentContainer(name: self.xcdatamodeld, managedObjectModel: managedObjectModel!)
        container.loadPersistentStores { (storeDescription, error) in
            if let err = error{
                fatalError("Loading of store failed:\(err)")
            }
        }
        return container
    }()
    
    public func getFetch(withPredicate predicate: String) throws -> [ParkingShiftCoreEntity]  { // example predicate = "departureDate != nil"
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<ParkingShiftCoreEntity>(entityName: "ParkingCoreEntity")
        fetchRequest.predicate = NSPredicate(format: predicate)

        do{
            let parkings = try context.fetch(fetchRequest)
            for (index, parking) in parkings.enumerated() {
                print("Parking \(index) - Admission date: \(parking.admissionDate?.description ?? "N/A") - Departure date:  \(parking.departureDate?.description ?? "N/A") - Plate:\(parking.vehicle?.plate ?? "N/A")")
            }
            return parkings
        } catch {
            throw InfrastructureErrors.errorFetchParkings()
        }
    }
}
