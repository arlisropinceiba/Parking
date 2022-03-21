//
//  MotorcyclePaymentModal.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 17/03/22.
//

import UIKit

class MotorcyclePaymentModal: UIViewController, PaymentModal {

    var vehicle: VehicleVisible

    init(vehicle: VehicleVisible) {
        self.vehicle = vehicle
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        box.layer.cornerRadius = 20
        guard let motorcycle = vehicle as? MotorcycleVisible else { return }
        image.image = motorcycle.getImage()
        plateLabel.text = motorcycle.getPlate()
        valueLabel.text = motorcycle.getValor().currencyInputFormatting()
        descriptionLabel.text = "\(motorcycle.getCylinderCapacity()) CC"
    }

    @IBAction func confirmProcess(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    func setView() {
        // Box
        view.addSubview(box)
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        box.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        box.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 30).isActive = true

        // Main Stack
        box.addSubview(mainStack)
        mainStack.centerXAnchor.constraint(equalTo: box.centerXAnchor, constant: 0).isActive = true
        mainStack.centerYAnchor.constraint(equalTo: box.centerYAnchor, constant: 0).isActive = true
        mainStack.topAnchor.constraint(equalTo: box.topAnchor, constant: 30).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 30).isActive = true

        // Info Vehicle Modal
        mainStack.addArrangedSubview(vehicleInfoStack)

        // Box Image
        vehicleInfoStack.addArrangedSubview(boxImage)
        boxImage.heightAnchor.constraint(equalToConstant: 70).isActive = true

        // Image
        boxImage.addSubview(image)
        image.centerXAnchor.constraint(equalTo: boxImage.centerXAnchor, constant: 0).isActive = true
        image.trailingAnchor.constraint(equalTo: boxImage.trailingAnchor, constant: 0).isActive = true
        image.topAnchor.constraint(equalTo: boxImage.topAnchor, constant: 0).isActive = true
        image.leadingAnchor.constraint(greaterThanOrEqualTo: boxImage.leadingAnchor, constant: 0).isActive = true
        image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        image.widthAnchor.constraint(equalToConstant: 70).isActive = true

        // Info Vehicle Modal
        vehicleInfoStack.addArrangedSubview(vehicleInfoStringsStack)

        // Plate Label
        vehicleInfoStringsStack.addArrangedSubview(plateLabel)

        // Description Label
        vehicleInfoStringsStack.addArrangedSubview(descriptionLabel)

        // Value Stack
        mainStack.addArrangedSubview(valueStack)

        // Value Description Label
        valueStack.addArrangedSubview(descriptionValueLabel)

        // Value Label
        valueStack.addArrangedSubview(valueLabel)

        // Confirm Button
        mainStack.addArrangedSubview(confirmButton)
    }

    var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var vehicleInfoStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var vehicleInfoStringsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var valueStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var box: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var boxImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var plateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var descriptionValueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Valor total a pagar"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var valueLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var confirmButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setTitle("Aceptar", for: .normal)
        button.addTarget(self, action: #selector(confirmProcess(_:)), for: .touchUpInside)
        return button
    }()
}
