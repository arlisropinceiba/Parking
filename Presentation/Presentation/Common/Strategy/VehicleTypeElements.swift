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
                                            CarParkingDataBaseRepository.shared),
            addVehiclemodal: AddCarModal()
        )
    }
    override func setPaymentModal(vehicle: VehicleVisible) {
        let modal = CarPaymentModal(vehicle: vehicle)
        setPaymentModalWithVehicle(modal: modal)
    }
    override func setLogTableCell(_ tableView: UITableView, _ indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarLogItemTableViewCell.self.debugDescription(),
                                                 for: indexPath) as? CarLogItemTableViewCell
        setLogTableCellWithTableView(cell: cell)
    }
}

class MotorcycleElements: VehicleTypeElements {
    init() {
        super.init(
            name: "Motos",
            translator: MotorcycleVisibleTranslator(),
            service: MotorcycleParkingShiftService(motorcycleParkingShiftRepository:
                                                    MotorcycleParkingDataBaseRepository.shared),
            addVehiclemodal: AddMotorcycleModal()
        )
    }
    override func setPaymentModal(vehicle: VehicleVisible) {
        let modal = MotorcyclePaymentModal(vehicle: vehicle)
        setPaymentModalWithVehicle(modal: modal)
    }
    override func setLogTableCell(_ tableView: UITableView, _ indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: MotorcycleLogItemTableViewCell.self.debugDescription(),
                                                 for: indexPath) as? MotorcycleLogItemTableViewCell
        setLogTableCellWithTableView(cell: cell)
    }
}

class VehicleTypeElements {
    private var name: String
    private var translator: VehicleVisibleTranslator
    private var service: ParkingShiftService
    private var addVehiclemodal: UIViewModal
    private var paymentModal: UIViewPaymentModal?
    private var logTableCell: UITableLogCell?

    public lazy var allLogTableCell: [UITableViewCell.Type] = {
        return [CarLogItemTableViewCell.self, MotorcycleLogItemTableViewCell.self]
    }()

    public lazy var allVehicleTypeCases: [VehicleTypeElements] = {
       return [CarElements(), MotorcycleElements()]
    }()

    init(name: String,
         translator: VehicleVisibleTranslator,
         service: ParkingShiftService,
         addVehiclemodal: UIViewModal
    ) {
        self.name = name
        self.translator = translator
        self.service = service
        self.addVehiclemodal = addVehiclemodal
    }
    convenience init() {
        self.init(
            name: "",
            translator: VehicleVisibleTranslator(),
            service: ParkingShiftService(parkingShitRepository: CarParkingDataBaseRepository.shared),
            addVehiclemodal: AddMotorcycleModal()
        )
    }
    func getType() -> String {
        return name
    }
    func getElements() -> (translator: VehicleVisibleTranslator, service: ParkingShiftService) {
        return(translator, service)
    }
    func getAddVehicleModal() -> UIViewModal {
        return addVehiclemodal
    }
    func setPaymentModal(vehicle: VehicleVisible) { }
    func setPaymentModalWithVehicle(modal: UIViewPaymentModal) {
        paymentModal = modal
    }
    func getPaymentModal() -> UIViewPaymentModal? {
        return paymentModal
    }
    func setLogTableCell(_ tableView: UITableView, _ indexPath: IndexPath) { }
    func setLogTableCellWithTableView(cell: UITableLogCell?) {
        logTableCell = cell
    }
    func getLogTableCell() -> UITableLogCell? {
        return logTableCell
    }
}
