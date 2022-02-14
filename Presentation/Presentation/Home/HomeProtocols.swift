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
    
}

protocol HomeInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol HomeInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeInteractorOutputProtocol? { get set }
}
