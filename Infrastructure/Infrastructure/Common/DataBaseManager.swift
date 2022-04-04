//
//  DataBaseManager.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import RealmSwift
import Domain

public class DataBaseManager {

    public static let shared = DataBaseManager()
    
    func saveObject(_ object: ParkingShiftDataBaseEntity) throws {
        let database = try! Realm()
        try! database.write {
            database.add(object)
        }
    }
    
    func updateObject(_ object: ParkingShiftDataBaseEntity, forThis newObject: ParkingShiftDataBaseEntity) throws {
        let database = try! Realm()
        try! database.write {
            object.uid = newObject.uid
            object.admissionDate = newObject.admissionDate
            object.departureDate = newObject.departureDate
            object.value = newObject.value
            object.type = newObject.type
            object.plate = newObject.plate
            object.cylinderCapacity = newObject.cylinderCapacity
        }
    }

    func getFetchCurrentParking() throws -> [ParkingShiftDataBaseEntity] {
        return try getFetch().filter({$0.departureDate == nil})
    }

    func getFetchHistoricalParking() throws -> [ParkingShiftDataBaseEntity] {
        return try getFetch().filter({$0.departureDate != nil})
    }

    func getFetchById(_ uid: UUID) throws -> [ParkingShiftDataBaseEntity] {
        return try getFetch().filter({$0.uid == uid})
    }

    private func getFetch() throws -> [ParkingShiftDataBaseEntity] {
        let database = try! Realm()
        let parkingShiftDataBaseEntities: Results<ParkingShiftDataBaseEntity> = database.objects(ParkingShiftDataBaseEntity.self)
        debugPrint(parkingShiftDataBaseEntities)
        return Array(parkingShiftDataBaseEntities)
    }

}
