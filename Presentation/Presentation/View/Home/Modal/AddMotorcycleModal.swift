//
//  AddVehicleModal.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//

import UIKit

class AddMotorcycleModal: UIViewController, AddVehicleModal {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var stackCapacity: UIStackView!
    @IBOutlet weak var plateLabel: UITextField!
    @IBOutlet weak var capacityLabel: UITextField!

    var completionWithValues: ((VehicleVisible) -> Void) = {_ in}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        box.layer.cornerRadius = 20
        capacityLabel.keyboardType = .numberPad
        capacityLabel.accessibilityIdentifier = "CapacityTextField"
        plateLabel.keyboardType = .alphabet
        plateLabel.accessibilityIdentifier = "PlateTextField"
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func add(_ sender: UIButton) {
        let cylinderCapacity: Int = Int(capacityLabel.text ?? "0") ?? 0
        let plate = plateLabel.text
        returnValues(plate: plate ?? "", cylinderCapacity: cylinderCapacity)
    }

    @IBAction func addWithRandomValues(_ sender: UIButton) {
        let cylinderCapacity: Int = Int.random(in: 200...1000)
        let plate: String = randomString(withLength: 3) + randomNumber(withLength: 3)
        returnValues(plate: plate, cylinderCapacity: cylinderCapacity)
    }
    
    func returnValues(plate: String, cylinderCapacity: Int) {
        let motorcycle = MotorcycleVisible(plate: plate.uppercased(),
                                            admissionDate: Date(),
                                            cylinderCapacity: cylinderCapacity)
        completionWithValues(motorcycle)
        dismiss(animated: true, completion: nil)
    }
}
