//
//  CarElements.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 19/04/22.
//

import Infrastructure
import Domain
import UIKit

class CarElements: VehicleTypeElements {

    var name: String
    var translator: VehicleVisibleTranslator
    var service: ParkingShiftService
    var addVehiclemodal: UIViewModal
    var paymentModal: UIViewPaymentModal?
    var logTableCell: UITableLogCell?
    

    init() {
        name = "Carros"
        translator = CarVisibleTranslator()
        service = CarParkingShiftService(carParkingShiftRepository:
                                            CarParkingDataBaseRepository.shared)
        addVehiclemodal = AddCarModal()
    }

    func setPaymentModal(vehicle: VehicleVisible) {
        let modal = CarPaymentModal(vehicle: vehicle)
        setPaymentModalWithVehicle(modal: modal)
    }

    func setLogTableCell(_ tableView: UITableView, _ indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarLogItemTableViewCell.self.debugDescription(),
                                                 for: indexPath) as? CarLogItemTableViewCell
        setLogTableCellWithTableView(cell: cell)
    }

    func setPaymentModalWithVehicle(modal: UIViewPaymentModal) {
        paymentModal = modal
    }

    func setLogTableCellWithTableView(cell: UITableLogCell?) {
        logTableCell = cell
    }
}
