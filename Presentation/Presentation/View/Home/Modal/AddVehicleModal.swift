//
//  AddVehicleModal.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/03/22.
//

protocol AddVehicleModal {
    var completionWithValues: ((VehicleVisible) -> Void) { get set }
}

extension AddVehicleModal {
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
        let arrayChar = arrayLength.map{_ in
            letters.randomElement()!
        }
        return String(arrayChar)
    }
}
