//
//  AddVehicleModal.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//

import UIKit

class AddMotorcycleModal: UIViewController, AddVehicleModal {

    var completionWithValues: ((VehicleVisible) -> Void) = {_ in}

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }

    @objc func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @objc func add(_ sender: UIButton) {
        let cylinderCapacity: Int = Int(capacityTextfield
        .text ?? "0") ?? 0
        let plate = plateTextfield
        .text
        returnValues(plate: plate ?? "", cylinderCapacity: cylinderCapacity)
    }

    @objc func addWithRandomValues(_ sender: UIButton) {
        let cylinderCapacity: Int = Int.random(in: 200...1000)
        let plate: String = randomString(withLength: 3) + randomNumber(withLength: 3)
        returnValues(plate: plate, cylinderCapacity: cylinderCapacity)
    }

    func returnValues(plate: String, cylinderCapacity: Int) {
        let motorcycle = MotorcycleVisible(plate: plate.uppercased(),
                                            admissionDate: Date(),
                                            cylinderCapacity: cylinderCapacity)
        completionWithValues(motorcycle)
        dismiss(animated: true, completion: nil)
    }

    func setView() {
        // Box
        view.addSubview(box)
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        box.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        box.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true

        // Main Stack
        box.addSubview(mainStack)
        mainStack.centerXAnchor.constraint(equalTo: box.centerXAnchor, constant: 0).isActive = true
        mainStack.centerYAnchor.constraint(equalTo: box.centerYAnchor, constant: 0).isActive = true
        mainStack.topAnchor.constraint(equalTo: box.topAnchor, constant: 30).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 30).isActive = true

        // Title Close Stack
        mainStack.addArrangedSubview(titleCloseStack)

        // Title Label
        titleCloseStack.addArrangedSubview(titleLabel)

        // Close Button
        titleCloseStack.addArrangedSubview(closeButton)
        closeButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 35).isActive = true

        // Plate Stack
        mainStack.addArrangedSubview(plateStack)

        // Plate Label
        plateStack.addArrangedSubview(plateLabel)
        plateLabel.widthAnchor.constraint(equalToConstant: 68).isActive = true

        // Plate TextField
        plateStack.addArrangedSubview(plateTextfield)

        // Capacity Stack
        mainStack.addArrangedSubview(capacityStack)

        // Capacity Label
        capacityStack.addArrangedSubview(capacityLabel)
        capacityLabel.widthAnchor.constraint(equalToConstant: 68).isActive = true

        // Capacity TextField
        capacityStack.addArrangedSubview(capacityTextfield)

        // Capacity Units Label
        capacityStack.addArrangedSubview(capacityUnitsLabel)

        // Add Button
        mainStack.addArrangedSubview(addButton)

        // Add With Random Values
        mainStack.addArrangedSubview(addWithRandomButton)
    }

    var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var titleCloseStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var plateStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var capacityStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var box: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Agregar vehículo"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var plateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Placa"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var capacityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Cilindraje"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var capacityUnitsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "CC"
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var closeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setTitle("x", for: .normal)
        button.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)
        return button
    }()

    var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setTitle("Agregar", for: .normal)
        button.addTarget(self, action: #selector(add(_:)), for: .touchUpInside)
        return button
    }()

    var addWithRandomButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setTitle("Valores aleatorios", for: .normal)
        button.addTarget(self, action: #selector(addWithRandomValues(_:)), for: .touchUpInside)
        return button
    }()

    var plateTextfield: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.placeholder = "ABC123"
        field.keyboardType = .alphabet
        field.accessibilityIdentifier = "PlateTextField"
        return field
    }()

    var capacityTextfield: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.placeholder = "550"
        field.keyboardType = .numberPad
        field.accessibilityIdentifier = "CapacityTextField"
        return field
    }()
}
