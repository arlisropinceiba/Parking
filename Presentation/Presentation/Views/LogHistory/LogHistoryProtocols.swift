//
//  LogHistoryProtocols.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//  
//

import Foundation
import UIKit

protocol LogHistoryViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: LogHistoryPresenterProtocol? { get set }
    func refreshTable(with data: [VehicleVisible])
    func showAlert(message: String)
}

protocol LogHistoryWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createLogHistoryModule() -> UIViewController
}

protocol LogHistoryPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: LogHistoryViewProtocol? { get set }
    var interactor: LogHistoryInteractorInputProtocol? { get set }
    var wireFrame: LogHistoryWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func loadData(withThisType type: VehicleType)
}

protocol LogHistoryInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func refreshData(with data: [VehicleVisible])
}

protocol LogHistoryInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: LogHistoryInteractorOutputProtocol? { get set }
    func fetchData(withThisType type: VehicleType) throws
}
