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
}

protocol HomeWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeModule() -> UIViewController
}

protocol HomePresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInputProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    
    func loadData(_ date: String, withThisType type: VehicleType)
    func refreshData(in date: String, with data: [VehicleVisible])
    func createShift(vehicle: VehicleVisible)
}

protocol HomeInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func refreshData(with data: [VehicleVisible])
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
    
    func createCarPakingShift(car: CarVisible) async throws
    func loadData(withThisType type: VehicleType) throws 
}
