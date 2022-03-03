//
//  Car.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public class Car: Vehicle {

    public override init (plate: String) throws {
        try super.init(plate: plate)
    }
}
