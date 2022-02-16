//
//  HomeWireFrame.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 14/02/22.
//

import UIKit

class HomeWireFrame: HomeWireFrameProtocol {

    class func createHomeModule() -> UIViewController {
        let navigationController = homeStoryboard.instantiateViewController(withIdentifier: "HomeView")
        if let view = navigationController as? HomeView {
            let presenter: HomePresenterProtocol & HomeInteractorOutputProtocol = HomePresenter()
            let interactor: HomeInteractorInputProtocol = HomeInteractor()
            let wireFrame: HomeWireFrameProtocol = HomeWireFrame()
            
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
    
    func showHome(from view: HomeViewProtocol) {
        let new = HomeWireFrame.createHomeModule()
        if let newView = view as? UIViewController{
            newView.navigationController?.pushViewController(new, animated: true)
        }
    }
}
