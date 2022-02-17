//
//  MotorcycleVisible.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import UIKit

class MotorcycleVisible: VehicleVisible {
    
    var cylinderCapacity: Int
    
    private init(id: UUID, plate: String, admissionDate: Date, cylinderCapacity: Int) {
        self.cylinderCapacity = cylinderCapacity
        super.init(id: id, plate: plate, image: UIImage(named: "motorcycle"), admissionDate: admissionDate, departureDate: nil, valor: "")
    }
    
    convenience public init(id: UUID, plate: String, admissionDate: Date){
        self.init(id: id, plate: plate, admissionDate: admissionDate, cylinderCapacity: 0)
    }
    
    convenience public init(plate: String, admissionDate: Date, cylinderCapacity: Int){
        self.init(id: UUID(), plate: plate, admissionDate: admissionDate, cylinderCapacity: cylinderCapacity)
    }
    
    func getCylinderCapacity() -> Int {
        return cylinderCapacity
    }
}
