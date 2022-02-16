//
//  VehicleVisible.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

import UIKit

class VehicleVisible {
    private var id: UUID
    private var plate: String
    private var image: UIImage?
    private var admissionDate: Date
    
    init(id: UUID, plate: String, image: UIImage?, admissionDate: Date) {
        self.id = id
        self.plate = plate
        self.image = image
        self.admissionDate = admissionDate
    }
    
    public func getPlate() -> String {
        return plate
    }
    
    public func getImage() -> UIImage? {
        return image
    }
    
    public func getAdmissionDate() -> Date {
        return admissionDate
    }
    
    public func getLenghtOfStay(fromAdmissionDateToNow right: Bool) -> String {
        return getLenghtOfStay(fromAdmissionDateTo: Date().localDate)
    }
    
    public func getLenghtOfStay(fromAdmissionDateTo endDate: Date) -> String {
        let diffComponents = Calendar.current.dateComponents([.hour], from: admissionDate, to: endDate)
        let hours = diffComponents.hour ?? 0
        var daysInt = 0
        var restHours = 0
        if hours > 0 {
            (daysInt, restHours) = getTheDaysAndHours(between: admissionDate, and: endDate)
        }
        if daysInt == 0 {
            return "\(hours)H"
        } else {
            return "\(daysInt)D \(restHours)H"
        }
    }
    
    private func getTheDaysAndHours(between beginDate: Date, and endDate: Date) -> (days: Int, hours: Int){
        let diffComponents = Calendar.current.dateComponents([.hour], from: beginDate, to: endDate)
        let hours = diffComponents.hour ?? 0
        let daysInt = Int(hours / 24)
        let restHours = Int(round((Double(hours) / 24 - Double(daysInt)) * 24.0))
        return (daysInt, restHours)
    }
}
