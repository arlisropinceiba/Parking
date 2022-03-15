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

    func loadData(_ date: String)
    func refreshData(in date: String, with data: [VehicleVisible])
    func createShift(vehicle: VehicleVisible)
    func finishShift(vehicle: VehicleVisible)
    func searchBy(plate: String)
    func showLogHistory()
    func loadVehicleType(_ type: VehicleTypeElements)
}

protocol HomeInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func refreshData(with data: [VehicleVisible])
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }

    func createParkingShift(withThisVehicle vehicle: VehicleVisible) async throws
    func fetchData() throws
    func fetchData(withThisPlate: String) throws
    func finishParkingShift(withThisVehicle vehicle: VehicleVisible) async throws -> VehicleVisible
    func loadVehicleType(_ type: VehicleTypeElements)
}
