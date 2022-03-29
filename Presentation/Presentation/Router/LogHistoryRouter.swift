//
//  LogHistoryRouter.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//  
//

import Foundation
import UIKit

class LogHistoryRouter: LogHistoryRouterProtocol {

    class func createLogHistoryModule() -> UIViewController {
        let view = LogHistoryView()
        let presenter: LogHistoryPresenterProtocol & LogHistoryInteractorOutputProtocol = LogHistoryPresenter()
        let interactor: LogHistoryInteractorInputProtocol = LogHistoryInteractor()
        let wireFrame: LogHistoryRouterProtocol = LogHistoryRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
