//
//  CarVisible.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import UIKit

class CarVisible: VehicleVisible {

    public init(uid: UUID, plate: String, admissionDate: Date) {
        super.init(uid: uid,
                   plate: plate,
                   image: UIImage(named: "car"),
                   admissionDate: admissionDate,
                   departureDate: nil,
                   valor: "")
    }

    public init(uid: UUID, plate: String, admissionDate: Date, departureDate: Date?, valor: String) {
        super.init(uid: uid,
                   plate: plate,
                   image: UIImage(named: "car"),
                   admissionDate: admissionDate,
                   departureDate: departureDate,
                   valor: valor)
    }

    convenience public init(plate: String, admissionDate: Date) {
        self.init(uid: UUID(), plate: plate, admissionDate: admissionDate)
    }

    convenience public init() {
        self.init(uid: UUID(), plate: "", admissionDate: Date())
    }
}
