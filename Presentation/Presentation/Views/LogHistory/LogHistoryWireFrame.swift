//
//  LogHistoryWireFrame.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//  
//

import Foundation
import UIKit

class LogHistoryWireFrame: LogHistoryWireFrameProtocol {

    class func createLogHistoryModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "LogHistoryView")
        if let view = navController as? LogHistoryView {
            let presenter: LogHistoryPresenterProtocol & LogHistoryInteractorOutputProtocol = LogHistoryPresenter()
            let interactor: LogHistoryInteractorInputProtocol = LogHistoryInteractor()
            let wireFrame: LogHistoryWireFrameProtocol = LogHistoryWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}
