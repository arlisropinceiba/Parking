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
    var date: Date = Date()
    
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
    
//    var containerView: UIView {
//        let view = UIView()
//        view.setTranslatesAutoresizingMaskIntoConstraints = false
//        return view
//    }
    
    var increaseHourButton: UIButton {
        let button = UIButton()
        button.setTitle("+1H", for: .normal)
        return button
    }
    
    // MARK: Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let clockView = containerView
//        view.addSubview(clockView)
//        
//        let viewsDictionary = ["view": clockView]
//        
//        clockView.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "H:|-[view]-|", options: [], metrics: nil, views: viewsDictionary))
//        clockView.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|-[view]-|", options: [], metrics: nil, views: viewsDictionary))
        
//        clockView.addSubview(clockLabel)
//        clockView.addSubview(increaseHourButton)
//        
//        let clockViewsDictionary = ["label": clockLabel, "button": increaseHourButton]
//        clockView.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "H:|[label]-15-[button(40)]|", options: [], metrics: nil, views: clockViewsDictionary))
//        clockView.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|[label]|", options: [], metrics: nil, views: clockViewsDictionary))
//        clockView.addConstraints( NSLayoutConstraint.constraints(withVisualFormat: "V:|[button(40)]|", options: [], metrics: nil, views: clockViewsDictionary))

        
    }
    
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}

