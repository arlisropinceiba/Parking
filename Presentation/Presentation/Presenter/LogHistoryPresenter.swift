//
//  LogHistoryPresenter.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//  
//

import Foundation

class LogHistoryPresenter {

    // MARK: Properties
    weak var view: LogHistoryViewProtocol?
    var interactor: LogHistoryInteractorInputProtocol?
    var wireFrame: LogHistoryRouterProtocol?

    func refreshData(with data: [VehicleVisible]) {
        view?.refreshTable(with: data)
    }

    func loadData(withThisType type: VehicleTypeElements) {
        do {
            try interactor?.fetchData(withThisType: type)
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
    }

    func searchBy(plate: String, withThisType type: VehicleTypeElements) {
        do {
            try interactor?.fetchData(withThisType: type, andThisPlate: plate)
        } catch let error {
            view?.showAlert(message: error.messageDescription())
        }
    }
}

extension LogHistoryPresenter: LogHistoryPresenterProtocol {
    func viewDidLoad() {
    }
}

extension LogHistoryPresenter: LogHistoryInteractorOutputProtocol {
}
