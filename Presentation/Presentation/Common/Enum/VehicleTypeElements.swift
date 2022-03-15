//
//  VehicleTypeElements.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import Infrastructure
import Domain
import UIKit

class CarElements: VehicleTypeElements {
    init() {
        super.init(
            name: "Carros",
            translator: CarVisibleTranslator(),
            service: CarParkingShiftService(carParkingShiftRepository:
                                            CarParkingCoreDataRepository.shared),
            modal: AddCarModal(nibName: "AddCarModal", bundle: nil)
        )
    }
}

class MotorcycleElements: VehicleTypeElements {
    init() {
        super.init(
            name: "Motos",
            translator: MotorcycleVisibleTranslator(),
            service: MotorcycleParkingShiftService(motorcycleParkingShiftRepository:
                                                    MotorcycleParkingCoreDataRepository.shared),
            modal: AddMotorcycleModal(nibName: "AddMotorcycleModal", bundle: nil))
    }
}

class VehicleTypeElements {
    private var name: String
    private var translator: VehicleVisibleTranslator
    private var service: ParkingShiftService
    private var modal: AddVehicleModal
    public lazy var allCases: [VehicleTypeElements] = {
       return [CarElements(), MotorcycleElements()]
    }()
    
    init(name: String,
         translator: VehicleVisibleTranslator,
         service: ParkingShiftService,
         modal: AddVehicleModal
    ) {
        self.name = name
        self.translator = translator
        self.service = service
        self.modal = modal
    }
    convenience init() {
        self.init(
            name: "",
            translator: VehicleVisibleTranslator(),
            service: ParkingShiftService(parkingShitRepository: CarParkingCoreDataRepository.shared),
            modal: AddMotorcycleModal(nibName: "AddMotorcycleModal", bundle: nil)
        )
    }
    func getType() -> String {
        return name
    }
    func getElements() -> (translator: VehicleVisibleTranslator, service: ParkingShiftService) {
        return(translator, service)
    }
    func getModal() -> AddVehicleModal {
        return modal
    }
    
}
