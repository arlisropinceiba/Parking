//
//  PaymentModal.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 17/02/22.
//

import UIKit

class PaymentModal: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var plateLabel: UILabel!
    @IBOutlet weak var descrptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var box: UIView!
    
    var vehicle: VehicleVisible?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        box.layer.cornerRadius = 20
        image.image = vehicle?.getImage()
        plateLabel.text = vehicle?.getPlate()
        descrptionLabel.text = vehicle is MotorcycleVisible ? "\((vehicle as! MotorcycleVisible).getCylinderCapacity()) CC": ""
        valueLabel.text = vehicle?.getValor()
    }
    
    @IBAction func confirmProcess(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
