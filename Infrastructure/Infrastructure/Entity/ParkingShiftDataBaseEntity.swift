//
//  VehicleRealmEntity.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 21/03/22.
//
//

import RealmSwift

public class ParkingShiftDataBaseEntity: Object {

    @Persisted var uid: UUID?
    @Persisted var admissionDate: Date?
    @Persisted var departureDate: Date?
    @Persisted var value: String?
    @Persisted var type: String?
    @Persisted var plate: String?
    @Persisted var cylinderCapacity: Int = 0

    convenience init(
        uid: UUID,
        admissionDate: Date,
        departureDate: Date?,
        value: String = "0",
        type: String,
        plate: String?,
        cylinderCapacity: Int = 0
    ) {
        self.init()
        self.uid = uid
        self.admissionDate = admissionDate
        self.departureDate = departureDate
        self.value = value
        self.type = type
        self.plate = plate
        self.cylinderCapacity = cylinderCapacity
    }
}
