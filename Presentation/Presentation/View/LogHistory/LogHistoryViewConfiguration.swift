//
//  LogHistoryViewConfiguration.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/03/22.
//

import UIKit

class LogHistoryViewConfiguration: UIView, ViewConfiguration {

    // MARK: ELements

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = "Historial"
        return label
    }()

    private var line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.systemGray
        return view
    }()

    private var blank: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var titleButtonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var titleStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var finderStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var vehiclesListButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
        button.setTitle("  Carros", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        return button
    }()

    private var searchVehiclesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        return button
    }()

    private var plateTextfield: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.placeholder = "ABC123"
        field.accessibilityIdentifier = "PlateFinder"
        return field
    }()

    private var table: UITableView = UITableView()

    func getView() -> UIView {
        setView()
        return self
    }

    func setView() {

        // MARK: Main Stack
        self.frame = CGRect(x: 0, y: 47, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 47)
        self.addSubview(mainStack)
        self.backgroundColor = .systemBackground
        mainStack.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        mainStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true

        // MARK: Title Button Stack
        mainStack.addArrangedSubview(titleButtonStack)

        // MARK: Title Button Stack
        titleButtonStack.addArrangedSubview(titleStack)

        // MARK: Back Button
        titleStack.addArrangedSubview(backButton)
        backButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: Title Label
        titleStack.addArrangedSubview(titleLabel)

        // MARK: Blank
        titleButtonStack.addArrangedSubview(blank)

        // MARK: List Button
        titleButtonStack.addArrangedSubview(vehiclesListButton)

        // MARK: Finder Stack
        mainStack.addArrangedSubview(finderStack)

        // MARK: Plate TextField
        finderStack.addArrangedSubview(plateTextfield)

        // MARK: Search Vehicles Button
        finderStack.addArrangedSubview(searchVehiclesButton)
        searchVehiclesButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        searchVehiclesButton.widthAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: Line
        self.addSubview(line)
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        line.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 20).isActive = true
        line.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true

        // MARK: Table
        table = UITableView()
        table.separatorColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(table)
        table.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        table.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 0).isActive = true
        table.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        table.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }

    func setSelectorSearchVehiclesButton(_ selector: Selector) {
        searchVehiclesButton.addTarget(self, action: selector, for: .touchUpInside)
    }

    func setSelectorBackButton(_ selector: Selector) {
        backButton.addTarget(self, action: selector, for: .touchUpInside)
    }

    func getSearchVehiclesButton() -> UIButton {
        return searchVehiclesButton
    }

    func getBackButton() -> UIButton {
        return searchVehiclesButton
    }

    func getVehiclesListButton() -> UIButton {
        return vehiclesListButton
    }

    func getPlateTextfield() -> UITextField {
        return plateTextfield
    }

    func getTableView() -> UITableView {
        return table
    }
}
