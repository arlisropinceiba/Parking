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
 
    func createShift(vehicle: VehicleVisible) {
        Task {
            do {
                try await interactor?.createCarPakingShift(car: vehicle as! CarVisible)
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
}

extension HomePresenter: HomePresenterProtocol {
    // TODO: implement presenter methods
}

extension HomePresenter: HomeInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
