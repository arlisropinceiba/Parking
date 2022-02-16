//
//  CarVisible.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import UIKit

class CarVisible: VehicleVisible {
    
    public init(id: UUID, plate: String, admissionDate: Date) {
        super.init(id: id, plate: plate, image: UIImage(named: "car"), admissionDate: admissionDate)
    }
    
    convenience public init(plate: String, admissionDate: Date){
        self.init(id: UUID(), plate: plate, admissionDate: admissionDate)
    }
}
