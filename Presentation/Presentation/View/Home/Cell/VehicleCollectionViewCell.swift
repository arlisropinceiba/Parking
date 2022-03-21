//
//  VehicleCollectionViewCell.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 26/01/22.
//

import UIKit

class VehicleCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(ofThis vehicle: VehicleVisible, withThisDate departureDate: Date) {
        setView()
        self.image.image = vehicle.getImage()
        self.label.text = vehicle.getPlate()
        timeLabel.text = vehicle.getLenghtOfStay(fromAdmissionDateTo: departureDate)
    }

    func setView() {
        // Image
        let widthCell = CellSize.shared
        contentView.addSubview(image)
        image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0).isActive = true
        image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        image.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 0).isActive = true
        image.heightAnchor.constraint(equalToConstant: widthCell).isActive = true
        image.widthAnchor.constraint(equalToConstant: widthCell).isActive = true

        // Time Label Box
        contentView.addSubview(timeBoxView)
        timeBoxView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        timeBoxView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true

        // Time Label
        timeBoxView.addSubview(timeLabel)
        timeLabel.centerXAnchor.constraint(equalTo: timeBoxView.centerXAnchor, constant: 0).isActive = true
        timeLabel.centerYAnchor.constraint(equalTo: timeBoxView.centerYAnchor, constant: 0).isActive = true
        timeLabel.topAnchor.constraint(equalTo: timeBoxView.topAnchor, constant: 5).isActive = true
        timeLabel.leadingAnchor.constraint(greaterThanOrEqualTo: timeBoxView.leadingAnchor, constant: 5).isActive = true

        // Label
        contentView.addSubview(label)
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -7).isActive = true
        label.leadingAnchor.constraint(greaterThanOrEqualTo: contentView.leadingAnchor, constant: 0).isActive = true

    }

    var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var timeBoxView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
