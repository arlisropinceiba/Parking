//
//  AddCarModal.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/03/22.
//

import UIKit

class AddCarModal: UIViewController, AddVehicleModal {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var plateLabel: UITextField!

    var completionWithValues: ((VehicleVisible) -> Void) = {_ in}

    override func viewDidLoad() {
        super.viewDidLoad()
        box.layer.cornerRadius = 20
        plateLabel.keyboardType = .alphabet
        plateLabel.accessibilityIdentifier = "PlateTextField"
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func add(_ sender: UIButton) {
        let plate = plateLabel.text
        returnValues(plate: plate ?? "")
    }

    @IBAction func addWithRandomValues(_ sender: UIButton) {
        let plate: String = randomString(withLength: 3) + randomNumber(withLength: 3)
        returnValues(plate: plate)
    }

    func returnValues(plate: String) {
        let car = CarVisible(plate: plate.uppercased(),
                             admissionDate: Date())
        completionWithValues(car)
        dismiss(animated: true, completion: nil)
    }
}
