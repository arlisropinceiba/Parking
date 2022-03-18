//
//  FinishShiftModel.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//

import UIKit

class FinishShiftModel: UIViewController {

    var vehicle: VehicleVisible
    var completion: () -> Void = {}

    init(vehicle: VehicleVisible){
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
        image.image = vehicle.getImage()
        plateLabel.text = vehicle.getPlate()
        let addmissionDate = (vehicle.getAdmissionDate()).inDateHourFormat()
        let text = """
        Ingreso el día \(addmissionDate) para un total de \(vehicle.getLenghtOfStayfromAdmissionDateToNow())
        """
        descriptionLabel.text = text
    }

    @objc func completionProcess(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        completion()
    }

    @objc func cancelProcess(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    func setView() {
        // Box
        view.addSubview(box)
        box.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        box.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        box.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true

        // Main Stack
        box.addSubview(mainStack)
        mainStack.centerXAnchor.constraint(equalTo: box.centerXAnchor, constant: 0).isActive = true
        mainStack.centerYAnchor.constraint(equalTo: box.centerYAnchor, constant: 0).isActive = true
        mainStack.topAnchor.constraint(equalTo: box.topAnchor, constant: 30).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 30).isActive = true

        // Box Image
        mainStack.addArrangedSubview(boxImage)
        boxImage.heightAnchor.constraint(equalToConstant: 70).isActive = true

        // Image

        boxImage.addSubview(image)
        image.centerXAnchor.constraint(equalTo: boxImage.centerXAnchor, constant: 0).isActive = true
        image.centerYAnchor.constraint(equalTo: boxImage.centerYAnchor, constant: 0).isActive = true
        image.topAnchor.constraint(equalTo: boxImage.topAnchor, constant: 0).isActive = true
        image.leadingAnchor.constraint(greaterThanOrEqualTo: boxImage.leadingAnchor, constant: 0).isActive = true
        image.heightAnchor.constraint(equalToConstant: 70).isActive = true
        image.widthAnchor.constraint(equalToConstant: 70).isActive = true

        // Plate Label
        mainStack.addArrangedSubview(plateLabel)

        // Description Label
        mainStack.addArrangedSubview(descriptionLabel)

        // Finish Button
        mainStack.addArrangedSubview(finishButton)

        // Cancel Button
        mainStack.addArrangedSubview(cancelButton)
    }

    var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 12.0
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
        label.accessibilityIdentifier = "ValueLabel"
        return label
    }()

    var finishButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setTitle("Finalizar turno", for: .normal)
        button.addTarget(self, action: #selector(completionProcess(_:)), for: .touchUpInside)
        return button
    }()

    var cancelButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setTitle("Cancelar", for: .normal)
        button.addTarget(self, action: #selector(cancelProcess(_:)), for: .touchUpInside)
        return button
    }()
}
