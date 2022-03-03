//
//  LogHistoryPresenter.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//  
//

import Foundation

class LogHistoryPresenter  {
    
    // MARK: Properties
    weak var view: LogHistoryViewProtocol?
    var interactor: LogHistoryInteractorInputProtocol?
    var wireFrame: LogHistoryRouterProtocol?
    
    func refreshData(with data: [VehicleVisible]) {
        view?.refreshTable(with: data)
    }
    
    func loadData(withThisType type: VehicleType) {
        do {
            try interactor?.fetchData(withThisType: type)
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
    }
    
    func searchBy(plate: String, withThisType type: VehicleType) {
        do {
            try interactor?.fetchData(withThisType: type, andThisPlate: plate)
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
    }
    
}

extension LogHistoryPresenter: LogHistoryPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension LogHistoryPresenter: LogHistoryInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
