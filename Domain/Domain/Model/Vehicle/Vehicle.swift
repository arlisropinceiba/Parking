//
//  Vehicle.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

public class Vehicle {
    private var plate: String = ""
    
    public init(plate: String) throws {
        try setPlate(plate)
    }
    
    public func getPlate() -> String {
        return plate
    }
    
    private func setPlate(_ plate: String) throws {
        if isThePlateValid(plate) {
            self.plate = plate
        } else {
            throw DomainErrors.InvalidPlate()
        }
    }
    
    private func isThePlateValid(_ plate: String) -> Bool {
        let plateRegularExpression = "[A-Za-z]{3}[0-9]{3}"
        let plateEvaluation = NSPredicate(format:"SELF MATCHES %@", plateRegularExpression)
        return plateEvaluation.evaluate(with: plate)
    }

}
