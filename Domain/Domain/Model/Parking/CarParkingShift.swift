//
//  CarParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

public class CarParkingShift: ParkingShift {
    
    public init(admissionDate: Date, car: Car) throws {
        super.init(admissionDate: admissionDate, vehicle: car)
        try itIsNotACarWithPlateAOnMondayOrSunday(admissionDate: admissionDate, plate: car.getPlate())
    }
    
    public init(admissionDate: Date, departureDate: Date, car: Car) throws {
        super.init(admissionDate: admissionDate, departureDate: departureDate, vehicle: car)
        try itIsNotACarWithPlateAOnMondayOrSunday(admissionDate: admissionDate, plate: car.getPlate())
    }
    
    private func itIsNotACarWithPlateAOnMondayOrSunday(admissionDate: Date, plate: String) throws {
        let dayOfWeek = getDayOfWeek(of: admissionDate)
        if beginsWithA(this: plate) && !( dayOfWeek == .Monday || dayOfWeek == .Sunday ) {
            throw DomainErrors.invalidLicensePlateToEnter()
        }
    }
    
    public func getCar() -> Car? {
        return getVehicle() as? Car
    }
    
    private func beginsWithA(this plate: String) -> Bool {
        return plate.first == "a" || plate.first == "A"
    }
    
    private func getDayOfWeek(of date: Date) -> DayOfWeek {
        let numberOfDay = Calendar.current.dateComponents([.weekday], from: date).weekday
        for day in DayOfWeek.allCases {
            if numberOfDay == day.rawValue {
                return day }
        }
        return .none
    }
}
