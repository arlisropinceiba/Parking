//
//  HomeViewConfiguration.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/03/22.
//

import UIKit

class HomeViewConfiguration: UIView, ViewConfiguration {

    // MARK: View ELements
    var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = Date().inHourDateFormat()
        return label
    }()

    var counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carros: 0"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.systemGray
        label.backgroundColor = UIColor.systemBackground
        label.numberOfLines = 0
        return label
    }()

    var line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.systemGray
        return view
    }()

    var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var timerButtonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var buttonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .trailing
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 13.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var addButtonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var finderStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var menu: UIMenu = {
        let menu = UIMenu()
        return menu
    }()

    var vehiclesListButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
        button.setTitle("  Carros", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = "VehiclesListButton"
        return button
    }()

    var logButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "list.dash"), for: .normal)
        return button
    }()

    var addVehiclesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setTitle("+", for: .normal)
        return button
    }()

    var searchVehiclesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        return button
    }()

    var plateTextfield: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.placeholder = "ABC123"
        field.accessibilityIdentifier = "PlateFinder"
        return field
    }()

    var collection: UICollectionView?
    
    func getView() -> UIView {
        setView()
        return self
    }
    
    func setView() {

        // MARK: Main Stack
        self.backgroundColor = .systemBackground
        self.addSubview(mainStack)
        mainStack.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        mainStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true

        // MARK: Timer Stack
        mainStack.addArrangedSubview(timerButtonsStack)

        // MARK: Timer Label
        timerButtonsStack.addArrangedSubview(timeLabel)

        // MARK: ButtonsStack
        timerButtonsStack.addArrangedSubview(buttonsStack)

        // MARK: Log Button
        buttonsStack.addArrangedSubview(logButton)
        logButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        logButton.widthAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: Add Buttons Stack
        buttonsStack.addArrangedSubview(addButtonsStack)

        // MARK: List Button
        addButtonsStack.addArrangedSubview(vehiclesListButton)

        // MARK: Add Button
        addButtonsStack.addArrangedSubview(addVehiclesButton)
        addVehiclesButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        addVehiclesButton.widthAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: Line
        self.addSubview(line)
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        line.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 20).isActive = true
        line.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true

        // MARK: Counter Label
        self.addSubview(counterLabel)
        counterLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        counterLabel.centerYAnchor.constraint(equalTo: line.centerYAnchor, constant: 0).isActive = true

        // MARK: Finder Stack
        mainStack.addArrangedSubview(finderStack)

        // MARK: Plate TextField
        finderStack.addArrangedSubview(plateTextfield)

        // MARK: Search Vehicles Button
        finderStack.addArrangedSubview(searchVehiclesButton)
        searchVehiclesButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        searchVehiclesButton.widthAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: Collection
        let widthCell = CellSize.shared
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: widthCell, height: widthCell)
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let frame = CGRect(x: line.frame.minX, y: line.frame.maxY, width: self.frame.width, height: 0.0)
        collection = UICollectionView(frame: frame, collectionViewLayout: layout)
        collection?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collection?.backgroundColor = .clear
        collection?.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(collection ?? UICollectionView())
        collection?.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        collection?.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 0).isActive = true
        collection?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        collection?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
}
