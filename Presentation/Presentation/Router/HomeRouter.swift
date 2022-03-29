//
//  HomeRouter.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 14/02/22.
//

import UIKit

class HomeRouter: HomeRouterProtocol {

    class func createHomeModule() -> UIViewController {
        let view = HomeView()
        let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
        let interactor: HomeInteractorInputProtocol = HomeInteractor()
        let wireFrame: HomeRouterProtocol = HomeRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.wireFrame = wireFrame
        presenter.interactor = interactor
        interactor.presenter = presenter

        return view
    }

    func showLogHistory(from view: HomeViewProtocol) {
        let new = LogHistoryRouter.createLogHistoryModule()
        if let newView = view as? UIViewController {
            newView.navigationController?.pushViewController(new, animated: true)
        }
    }
}
