//
//  MotorcycleElements.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 19/04/22.
//

import Infrastructure
import Domain
import UIKit

class MotorcycleElements: VehicleTypeElements {

    var name: String
    var translator: VehicleVisibleTranslator
    var service: ParkingShiftService
    var addVehiclemodal: UIViewModal
    var paymentModal: UIViewPaymentModal?
    var logTableCell: UITableLogCell?

    init() {
        name = "Motos"
        translator = MotorcycleVisibleTranslator()
        service = MotorcycleParkingShiftService(motorcycleParkingShiftRepository:
                                                    MotorcycleParkingDataBaseRepository.shared)
        addVehiclemodal = AddMotorcycleModal()
    }

    func setPaymentModal(vehicle: VehicleVisible) {
        let modal = MotorcyclePaymentModal(vehicle: vehicle)
        setPaymentModalWithVehicle(modal: modal)
    }

    func setLogTableCell(_ tableView: UITableView, _ indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: MotorcycleLogItemTableViewCell.self.debugDescription(),
                                                 for: indexPath) as? MotorcycleLogItemTableViewCell
        setLogTableCellWithTableView(cell: cell)
    }

    func setPaymentModalWithVehicle(modal: UIViewPaymentModal) {
        paymentModal = modal
    }

    func setLogTableCellWithTableView(cell: UITableLogCell?) {
        logTableCell = cell
    }
}
