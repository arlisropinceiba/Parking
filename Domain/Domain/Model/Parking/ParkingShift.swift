//
//  ParkingShift.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

public class ParkingShift {
   
    private var id: UUID = UUID()
    private var admissionDate: Date
    private var departureDate: Date?
    private var vehicle: Vehicle
    
    public init(
        admissionDate: Date,
        departureDate: Date?,
        vehicle: Vehicle
    ) throws {
        self.admissionDate = admissionDate
        self.departureDate = departureDate
        self.vehicle = vehicle
        try itIsNotACarWithPlateAOnMondayOrSunday(admissionDate: admissionDate, plate: vehicle.getPlate())
    }
    
    convenience public init(
        admissionDate: Date,
        vehicle: Vehicle
    ) throws {
        try self.init(admissionDate: admissionDate, departureDate: nil, vehicle: vehicle)
        try itIsNotACarWithPlateAOnMondayOrSunday(admissionDate: admissionDate, plate: vehicle.getPlate())
    }

    //MARK: SET
    public func setDepartureDate(_ date: Date) throws {
        if date >= admissionDate {
            departureDate = date
        } else {
            throw DomainErrors.InvalidDate()
        }
    }
    
    //MARK: GET
    public func getId() -> UUID {
        return id
    }
    
    public func getAdmissionDate() -> Date {
        return admissionDate
    }
    
    public func getDepartureDate() throws -> Date {
        guard let date = departureDate else {
            throw DomainErrors.NoExistDepartureDate()
        }
        return date
    }
    
    private func itIsNotACarWithPlateAOnMondayOrSunday(admissionDate: Date, plate: String) throws {
        let dayOfWeek = getDayOfWeek(of: admissionDate)
        if beginsWithA(this: plate) && !( dayOfWeek == .Monday || dayOfWeek == .Sunday ) {
            throw DomainErrors.InvalidLicensePlateToEnter()
        }
    }
    
    private func beginsWithA(this plate: String) -> Bool {
        let plateUppercased = plate.uppercased()
        return plateUppercased.first == "A"
    }
    
    private func getDayOfWeek(of date: Date) -> DayOfWeek {
        let numberOfDay = Calendar.current.dateComponents([.weekday], from: date).weekday
        for day in DayOfWeek.allCases {
            if numberOfDay == day.rawValue {
                return day }
        }
        return .none
    }
    
    func getVehicle() -> Vehicle {
        return vehicle
    }
}
