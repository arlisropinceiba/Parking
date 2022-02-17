//
//  HomePresenter.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 14/02/22.
//
import Foundation

class HomePresenter  {
    
    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeWireFrameProtocol?
 
    func createShift(vehicle: VehicleVisible, withThisType type: VehicleType) {
        Task {
            do {
                switch type {
                case .car:
                    try await interactor?.createCarParkingShift(car: vehicle as! CarVisible)
                case .motorcycle:
                    try await interactor?.createMotorcycleParkingShift(motorcycle: vehicle as! MotorcycleVisible)
                }
            } catch let error {
                view?.showAlert(message: error.messageDescription())
            }
        }
    }
    
    func finishShift(vehicle: VehicleVisible, withThisType type: VehicleType) {
        Task {
            do {
                switch type {
                case .car:
                    let newVehicle = try await interactor?.finishCarParkingShift(car: vehicle as! CarVisible)
                    view?.showPayment(vehicle: newVehicle!)
                case .motorcycle:
                    let newVehicle = try await interactor?.finishMotorcycleParkingShift(motorcycle: vehicle as! MotorcycleVisible)
                    view?.showPayment(vehicle: newVehicle!)
                }
            } catch let error {
                view?.showAlert(message: error.messageDescription())
            }
        }
    }
    
    func loadData(_ date: String, withThisType type: VehicleType) {
        view?.setTimeLabelText(text: date)
        do {
            try interactor?.loadData(withThisType: type)
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
    }
    
    func refreshData(in date: String, with data: [VehicleVisible]) {
        view?.setTimeLabelText(text: date)
    }
    
    func refreshData(with data: [VehicleVisible]) {
        DispatchQueue.main.async { [self] in
            view?.setCounterLabelText(text:"\(data.count)")
            view?.refreshCollection(with: data)}
    }
    
    func showLogHistory() {
        wireFrame?.showLogHistory(from: view!)
    }
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
