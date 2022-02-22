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
    @IBOutlet weak var vehicleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        box.layer.cornerRadius = 10
        box.layer.borderWidth = 1
        box.layer.borderColor = #colorLiteral(red: 0.001902872347, green: 0.2908241451, blue: 0.32291466, alpha: 1)
    }

    func initWithData(vehicle: VehicleVisible){
        vehicleImage.image = vehicle.getImage()
        let descriptionVehicle = vehicle is MotorcycleVisible ? "\((vehicle as! MotorcycleVisible).getCylinderCapacity()) CC":""
        plateLabel.text = vehicle.getPlate() + "\n" + descriptionVehicle
        let text = "🗓 Fecha de ingreso: \(vehicle.getAdmissionDate().inDateHourFormat()) \n🗓 Fecha de salida: \(vehicle.getDepartureDate()?.inDateHourFormat() ?? "") \n🕗 Total tiempo: \(vehicle.getLenghtOfStay()) \n💲 Valor total: \(vehicle.getValor())"
        descriptionLabel.text = text
    }
    
}
