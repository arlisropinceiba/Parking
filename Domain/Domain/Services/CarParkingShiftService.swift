//
//  CarParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

public class CarParkingShiftService: ParkingShiftService {
    
    public func saveThis(shift: ParkingShift) throws {
        try areThereParkingSpaces()
        try itIsNotACarWithPlateAOnMondayOrSunday(admissionDate: shift.getAdmissionDate(), plate: shift.getVehicle().getPlate())
        try saveParkingShift(shift: shift)
    }
    
    private func areThereParkingSpaces() throws {
        let minimumNumberOfCarsAllowed = 20
        guard parkingShitRepository.getCountOfVehicles() < minimumNumberOfCarsAllowed else {
            throw DomainErrors.carLimitReached()
        }
    }
    
    private func itIsNotACarWithPlateAOnMondayOrSunday(admissionDate: Date, plate: String) throws {
        let dayOfWeek = getDayOfWeek(of: admissionDate)
        if beginsWithA(this: plate) && !( dayOfWeek == "lunes" || dayOfWeek == "domingo" ) {
            throw DomainErrors.invalidLicensePlateToEnter()
        }
    }
    
    private func beginsWithA(this plate: String) -> Bool {
        let plateRegularExpression = "[A][A-Z]{2}[0-9]{3}"
        let plateEvaluation = NSPredicate(format:"SELF MATCHES %@", plateRegularExpression)
        return plateEvaluation.evaluate(with: plate)
    }
    
    private func getDayOfWeek(of date: Date) -> String {
        let dateFormatterDate = DateFormatter()
        dateFormatterDate.dateFormat = "EEEE"
        let day = dateFormatterDate.string(from: date)
        return day
    }

}
