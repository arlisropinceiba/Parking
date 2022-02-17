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
    var wireFrame: LogHistoryWireFrameProtocol?
    
}

extension LogHistoryPresenter: LogHistoryPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension LogHistoryPresenter: LogHistoryInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
