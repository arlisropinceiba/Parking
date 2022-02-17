//
//  LogItemTableViewCell.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//

import UIKit

class LogItemTableViewCell: UITableViewCell {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var plateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        box.layer.cornerRadius = 10
        box.layer.borderWidth = 1
        box.layer.borderColor = #colorLiteral(red: 0.001902872347, green: 0.2908241451, blue: 0.32291466, alpha: 1)
    }

    func initWithData(vehicle: VehicleVisible){
        let text = "Fecha de ingreso: \(vehicle.getAdmissionDate().inDateHourFormat()) \nFecha de salida: \(vehicle.getDepartureDate()?.inDateHourFormat() ?? "") \nTotal tiempo: \(vehicle.getLenghtOfStay()) \nValor total: \(vehicle.getValor())"
        plateLabel.text = vehicle.getPlate()
        descriptionLabel.text = text
    }
    
}
