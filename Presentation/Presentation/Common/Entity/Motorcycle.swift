//
//  MotorcycleVisible.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import UIKit

class MotorcycleVisible: VehicleVisible {

    var cylinderCapacity: Int

    public init(uid: UUID,
                plate: String,
                admissionDate: Date,
                cylinderCapacity: Int) {
        self.cylinderCapacity = cylinderCapacity
        super.init(uid: uid,
                   plate: plate,
                   image: UIImage(named: "motorcycle"),
                   admissionDate: admissionDate,
                   departureDate: nil,
                   valor: "")
    }

    public init(uid: UUID,
                plate: String,
                admissionDate: Date,
                cylinderCapacity: Int,
                departureDate: Date?,
                valor: String) {
        self.cylinderCapacity = cylinderCapacity
        super.init(uid: uid,
                   plate: plate,
                   image: UIImage(named: "motorcycle"),
                   admissionDate: admissionDate,
                   departureDate: departureDate,
                   valor: valor)
    }

    convenience public init(uid: UUID,
                            plate: String,
                            admissionDate: Date) {
        self.init(uid: uid,
                  plate: plate,
                  admissionDate: admissionDate,
                  cylinderCapacity: 0)
    }

    convenience public init(plate: String,
                            admissionDate: Date,
                            cylinderCapacity: Int) {
        self.init(uid: UUID(),
                  plate: plate,
                  admissionDate: admissionDate,
                  cylinderCapacity: cylinderCapacity)
    }

    func getCylinderCapacity() -> Int {
        return cylinderCapacity
    }
}
