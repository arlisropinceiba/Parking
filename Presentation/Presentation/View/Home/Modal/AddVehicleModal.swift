//
//  AddVehicleModal.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//

import UIKit

class AddVehicleModal: UIViewController {

    @IBOutlet weak var box: UIView!
    @IBOutlet weak var stackCapacity: UIStackView!
    @IBOutlet weak var plateLabel: UITextField!
    @IBOutlet weak var capacityLabel: UITextField!

    var vehicleType: VehicleType = .car
    var admissionDate: Date?
    var completionWithValues: (VehicleVisible) -> Void = {_ in}

    override func viewDidLoad() {
        super.viewDidLoad()
        box.layer.cornerRadius = 20
        stackCapacity.isHidden = !(vehicleType == .motorcycle)
        capacityLabel.keyboardType = .numberPad
        capacityLabel.accessibilityIdentifier = "CapacityTextField"
        plateLabel.keyboardType = .alphabet
        plateLabel.accessibilityIdentifier = "PlateTextField"
    }

    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func add(_ sender: UIButton) {
        let capacity: Int = Int(capacityLabel.text ?? "0") ?? 0
        let plate = plateLabel.text
        returnValues(plate: plate ?? "", cylinderCapacity: capacity)
    }

    @IBAction func addWithRandomValues(_ sender: UIButton) {
        let cylinderCapacity: Int = Int.random(in: 200...1000)
        let plate: String = randomString(withLength: 3) + randomNumber(withLength: 3)
        returnValues(plate: plate, cylinderCapacity: cylinderCapacity)
    }

    func returnValues(plate: String, cylinderCapacity: Int) {
        switch vehicleType {
        case .car:
            let car = CarVisible(plate: plate.uppercased(),
                                 admissionDate: admissionDate ?? Date())
            completionWithValues(car)
            dismiss(animated: true, completion: nil)
        case .motorcycle:
            let motorcycle = MotorcycleVisible(plate: plate.uppercased(),
                                               admissionDate: admissionDate ?? Date(),
                                               cylinderCapacity: cylinderCapacity)
            completionWithValues(motorcycle)
            dismiss(animated: true, completion: nil)
        }
    }

    func randomString(withLength length: Int) -> String {
        let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        let arrayLength = (0..<length)
        let arrayChar = arrayLength.map{number in
            letters.randomElement()!
        }
        return String(arrayChar)
    }

    func randomNumber(withLength length: Int) -> String {
        let letters = "0123456789"
        let arrayLength = (0..<length)
        let arrayChar = arrayLength.map{number in
            letters.randomElement()!
        }
        return String(arrayChar)
    }
}
