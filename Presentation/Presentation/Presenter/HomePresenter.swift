//
//  HomePresenter.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 14/02/22.
//
import Foundation
import Combine

class HomePresenter {

    // MARK: Properties
    weak var view: HomeViewProtocol?
    var interactor: HomeInteractorInputProtocol?
    var wireFrame: HomeRouterProtocol?
    
    func createShift(vehicle: VehicleVisible) {
        Task {
            do {
                try await interactor?.createParkingShift(withThisVehicle: vehicle)
            } catch let error {
                view?.showAlert(message: error.messageDescription())
            }
        }
    }

    func finishShift(vehicle: VehicleVisible) {
        Task {
            do {
                let newVehicle = try await interactor?.finishParkingShift(withThisVehicle: vehicle)
                view?.showPayment(vehicle: newVehicle!)
            } catch let error {
                view?.showAlert(message: error.messageDescription())
            }
        }
    }

    func loadData(_ date: String) {
        view?.setTimeLabelText(text: date)
        do {
            try interactor?.fetchData()
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
    }

    func refreshData(in date: String, with data: [VehicleVisible]) {
        view?.setTimeLabelText(text: date)
    }

    func refreshData(with data: [VehicleVisible]) {
        DispatchQueue.main.async { [self] in
            view?.setCounterLabelText(text: "\(data.count)")
            view?.refreshCollection(with: data)}
    }

    func searchBy(plate: String) {
        do {
            try interactor?.fetchData(withThisPlate: plate)
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
    }

    func showLogHistory() {
        wireFrame?.showLogHistory(from: view!)
    }
}

extension HomePresenter: HomePresenterProtocol {
    
    func loadVehicleType(_ type: VehicleTypeElements) {
        interactor?.loadVehicleType(type)
    }
    
}

extension HomePresenter: HomeInteractorOutputProtocol {
}
