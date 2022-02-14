//
//  HomeView.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import UIKit

class HomeView: UIViewController {
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    
    var clockLabel: UILabel {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 45)
        return label
    }
    
    var counterLabel: UILabel {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }
    
    var line: UIView {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }
    
    var containerView: UIView {
        return UIView()
    }
    
    // MARK: Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}

