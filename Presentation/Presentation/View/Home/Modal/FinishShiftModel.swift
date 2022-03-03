//
//  FinishShiftModel.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//

import UIKit

class FinishShiftModel: UIViewController {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var plateLabel: UILabel!

    var vehicle: VehicleVisible?
    var completion: () -> Void = {}

    override func viewDidLoad() {
        super.viewDidLoad()
        box.layer.cornerRadius = 20
        image.image = vehicle?.getImage()
        plateLabel.text = vehicle?.getPlate()
        let addmissionDate = (vehicle?.getAdmissionDate() ?? Date()).inDateHourFormat()
        let text = """
        Ingreso el día \(addmissionDate) para un total de \(vehicle?.getLenghtOfStayfromAdmissionDateToNow() ?? "...")
        """

        descriptionLabel.text = text
        descriptionLabel.accessibilityIdentifier = "ValueLabel"
    }

    @IBAction func completionProcess(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        completion()
    }

    @IBAction func cancelProcess(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
