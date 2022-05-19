//
//  VehicleTypeElements.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import Infrastructure
import Domain
import UIKit

protocol VehicleTypeElements {
    var name: String { get set }
    var translator: VehicleVisibleTranslator { get set }
    var service: ParkingShiftService { get set }
    var addVehiclemodal: UIViewModal { get set }
    var paymentModal: UIViewPaymentModal? { get set }
    var logTableCell: UITableLogCell? { get set }

    func setPaymentModal(vehicle: VehicleVisible)

    func setLogTableCell(_ tableView: UITableView, _ indexPath: IndexPath)

    func setPaymentModalWithVehicle(modal: UIViewPaymentModal)

    func setLogTableCellWithTableView(cell: UITableLogCell?)
}

extension VehicleTypeElements {

    func getAllLogTableCell() -> [UITableViewCell.Type] {
        return [CarLogItemTableViewCell.self, MotorcycleLogItemTableViewCell.self]
    }

    func getAllVehicleTypeCases() -> [VehicleTypeElements] {
       return [CarElements(), MotorcycleElements()]
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

    func getPaymentModal() -> UIViewPaymentModal? {
        return paymentModal
    }

    func getLogTableCell() -> UITableLogCell? {
        return logTableCell
    }
}
