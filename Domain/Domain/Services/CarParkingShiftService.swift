//
//  CarParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public class CarParkingShiftService: ParkingShiftService {
        
    public init(carParkingShiftRepository: CarParkingShiftRepository) {
        super.init(parkingShitRepository: carParkingShiftRepository)
    }
    
    public override func saveThis(shift: ParkingShift) throws {
        try areThereParkingSpaces()
        try super.saveThis(shift: shift)
    }
    
    private func areThereParkingSpaces() throws {
        let minimumNumberOfCarsAllowed = 20
        let carsCount  = try (parkingShitRepository as? CarParkingShiftRepository)?.getCountOfCars() ?? minimumNumberOfCarsAllowed
        guard carsCount < minimumNumberOfCarsAllowed else {
            throw DomainErrors.carLimitReached()
        }
    }
}
