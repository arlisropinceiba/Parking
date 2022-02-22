//
//  VehicleCollectionViewCell.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 26/01/22.
//

import UIKit

class VehicleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var width: NSLayoutConstraint!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var widthImage: NSLayoutConstraint!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(ofThis vehicle: VehicleVisible, withThisDate departureDate: Date, inWindowWidth widthView: CGFloat){
        setSize(widthView)
        self.image.image = vehicle.getImage()
        self.label.text = vehicle.getPlate()
        timeLabel.text = vehicle.getLenghtOfStay(fromAdmissionDateTo: departureDate)
    }

    func setSize(_ widthView: CGFloat) {
        let numberOfVehiclesToShowByRow: CGFloat = UIDevice.current.orientation.isLandscape ? 8.0:4.0
        let widthCell = ((widthView - 20) / numberOfVehiclesToShowByRow)
        
        width.constant = widthCell
        widthImage.constant = widthCell - 10
    }
}
