//
//  HomeRouter.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 14/02/22.
//

import UIKit

class HomeRouter: HomeRouterProtocol {

    class func createHomeModule() -> UIViewController {
        let navigationController = homeStoryboard.instantiateViewController(withIdentifier: "HomeView")
        if let view = navigationController as? HomeView {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol = HomeInteractor()
            let wireFrame: HomeRouterProtocol = HomeRouter()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navigationController
        }
        return UIViewController()
    }

    static var homeStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    func showLogHistory(from view: HomeViewProtocol) {
        let new = LogHistoryRouter.createLogHistoryModule()
        if let newView = view as? UIViewController{
            newView.navigationController?.pushViewController(new, animated: true)
        }
    }
}
