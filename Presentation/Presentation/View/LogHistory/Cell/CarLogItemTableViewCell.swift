//
//  CarLogItemTableViewCell.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 18/03/22.
//

import UIKit

class CarLogItemTableViewCell: UITableViewCell, LogItemTableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func initWithData(vehicle: VehicleVisible) {
        setView()
        guard let car = vehicle as? CarVisible else { return }
        vehicleImage.image = car.getImage()
        let addmissionDate = car.getAdmissionDate().inDateHourFormat()
        let departureDate = (car.getDepartureDate() ?? Date()).inDateHourFormat()
        plateLabel.text = car.getPlate()
        let text = """
        🗓 Fecha de ingreso: \(addmissionDate)
        🗓 Fecha de salida: \(departureDate)
        🕗 Total tiempo: \(car.getLenghtOfStay())
        💲 Valor total: \(car.getValor())
        """
        descriptionLabel.text = text
    }

    func setView() {
        // Box
        contentView.addSubview(box)
        box.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        box.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        box.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        box.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 30).isActive = true

        // Main Stack
        box.addSubview(mainStack)
        mainStack.centerXAnchor.constraint(equalTo: box.centerXAnchor, constant: 0).isActive = true
        mainStack.centerYAnchor.constraint(equalTo: box.centerYAnchor, constant: 0).isActive = true
        mainStack.topAnchor.constraint(equalTo: box.topAnchor, constant: 15).isActive = true
        mainStack.leadingAnchor.constraint(greaterThanOrEqualTo: box.leadingAnchor, constant: 15).isActive = true

        // Info Vehicle Modal
        mainStack.addArrangedSubview(vehicleInfoStack)

        // Box Image
        vehicleInfoStack.addArrangedSubview(boxImage)
        boxImage.heightAnchor.constraint(equalToConstant: 70).isActive = true

        // Image
        boxImage.addSubview(vehicleImage)
        vehicleImage.centerXAnchor.constraint(equalTo: boxImage.centerXAnchor, constant: 0).isActive = true
        vehicleImage.trailingAnchor.constraint(equalTo: boxImage.trailingAnchor, constant: 0).isActive = true
        vehicleImage.topAnchor.constraint(equalTo: boxImage.topAnchor, constant: 0).isActive = true
        vehicleImage.leadingAnchor.constraint(greaterThanOrEqualTo: boxImage.leadingAnchor, constant: 0).isActive = true
        vehicleImage.heightAnchor.constraint(equalToConstant: 70).isActive = true
        vehicleImage.widthAnchor.constraint(equalToConstant: 70).isActive = true

        // Plate Label
        vehicleInfoStack.addArrangedSubview(plateLabel)

        // Description Label
        mainStack.addArrangedSubview(descriptionLabel)

        // Line
        box.addSubview(line)
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.centerXAnchor.constraint(equalTo: box.centerXAnchor, constant: 0).isActive = true
        line.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10).isActive = true
        line.leadingAnchor.constraint(equalTo: box.leadingAnchor, constant: 0).isActive = true
    }

    var box: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.001902872347, green: 0.2908241451, blue: 0.32291466, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 20
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

    var boxImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var vehicleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var plateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.001902872347, green: 0.2908241451, blue: 0.32291466, alpha: 1)
        return view
    }()

    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .label
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
