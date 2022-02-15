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
    
    var clockLabel = UILabel()
    
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
        let view = UIView()
        view.backgroundColor = .black
        return view
    }
    
    var increaseHourButton = UIButton()
    
    // MARK: Lifecycle

    
    override func viewDidLoad() {
        super.viewDidLoad()
        clockLabel.adjustsFontSizeToFitWidth = true
        clockLabel.numberOfLines = 0
        clockLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        clockLabel.font = UIFont.systemFont(ofSize: 45)
        clockLabel.text = date.inHourDateFormat()
        clockLabel.textAlignment = .left
        view.addSubview(clockLabel)
        
        increaseHourButton.setTitle("+1H", for: .normal)
        view.addSubview(increaseHourButton)
        
        let viewsDictionary = [
            "label": clockLabel,
            "button": increaseHourButton
        ]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[label]-|", options: [], metrics: nil, views: viewsDictionary as [String : Any]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[button(40)]-|", options: [], metrics: nil, views: viewsDictionary as [String : Any]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[label]-15-[button(40)]-|", options: [], metrics: nil, views: viewsDictionary as [String : Any]))
        
        
    }
    
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}

