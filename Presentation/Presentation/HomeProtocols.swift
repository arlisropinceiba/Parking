//
//  HomeProtocols.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 14/02/22.
//

import UIKit

protocol HomeViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomePresenterProtocol? { get set }

    func setTimeLabelText(text: String)
    func setCounterLabelText(text: String)
    func refreshCollection(with data: [VehicleVisible])
    func showAlert(message: String)
    func showPayment(vehicle: VehicleVisible)
}

protocol HomeRouterProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
    func showLogHistory(from view: HomeViewProtocol)
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeRouterProtocol? { get set }

    func loadData(_ date: String, withThisType type: VehicleType)
    func refreshData(in date: String, with data: [VehicleVisible])
    func createShift(vehicle: VehicleVisible, withThisType type: VehicleType)
    func finishShift(vehicle: VehicleVisible, withThisType type: VehicleType)
    func searchBy(plate: String, withThisType type: VehicleType) 
    func showLogHistory()
}

protocol HomeInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func refreshData(with data: [VehicleVisible])
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }

    func createParkingShift(withThisType type: VehicleType, andThisVehicle vehicle: VehicleVisible) async throws
    func fetchData(withThisType type: VehicleType) throws
    func fetchData(withThisType type: VehicleType, andThisPlate: String) throws
    func finishParkingShift(withThisType type: VehicleType,
                            andThisVehicle vehicle: VehicleVisible) async throws -> VehicleVisible
}
