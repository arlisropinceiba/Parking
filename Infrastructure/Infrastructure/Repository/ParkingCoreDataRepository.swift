//
//  ParkingDataBaseRepository.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import Domain
import RealmSwift

public class ParkingDataBaseRepository: ParkingShiftRepository {

    private var dataBaseManager = DataBaseManager()
    private var translator: VehicleParkingShiftTranslator = VehicleParkingShiftTranslator()

    init (translator: VehicleParkingShiftTranslator) {
        self.translator = translator
    }

    public func saveParkingShift(shift: ParkingShift) throws {
        let parkingShiftDataBase = try translator.fromDomainToDataBaseEntity(shift)
        print(parkingShiftDataBase)
        try dataBaseManager.saveObject(parkingShiftDataBase)
    }

    public func getParkingShift() throws -> [ParkingShift] {
        let parkingShiftsSaved = try getFetchActiveParkingShifts()
        let parkingShiftDomainArray: [ParkingShift] = try translator.fromDataBaseToDomainEntity(parkingShiftsSaved)
        return parkingShiftDomainArray
    }

    public func getFinalizedParkingShifts() throws -> [ParkingShiftPayment] {
        let parkingShiftsSaved: [ParkingShiftDataBaseEntity] = try dataBaseManager.getFetchHistoricalParking()
        let parkingShiftDomainArray: [ParkingShiftPayment] = try translator.fromDataBaseToDomainEntity(parkingShiftsSaved)
        return parkingShiftDomainArray
    }

    public func searchParkingShift(withPlate plate: String) throws -> [ParkingShift] {
        let parkingShiftSaved = try fetchParkingShift(withPlate: plate)
        let parkingShiftDomainArray: [ParkingShift] = try translator.fromDataBaseToDomainEntity(parkingShiftSaved)
        return parkingShiftDomainArray
    }

    public func searchFinalizedParkingShift(withPlate plate: String) throws -> [ParkingShiftPayment] {
        let parkingShiftsSaved = try fetchFinalizedParkingShift(withPlate: plate)
        let parkingShiftDomainArray: [ParkingShiftPayment] = try translator.fromDataBaseToDomainEntity(parkingShiftsSaved)
        return parkingShiftDomainArray
    }

    public func finishParkingShift(shift: ParkingShiftPayment) throws {
        let parkingShiftsSaved = try dataBaseManager.getFetchById(shift.getParkingShift().getId())
        let parkingShiftPayment = try translator.fromDomainToDataBaseEntity(shift)
        guard let shift = parkingShiftsSaved.first else {
            throw InfrastructureErrors.ErrorUpdatingParking()
        }
        try dataBaseManager.updateObject(shift, forThis: parkingShiftPayment)
    }

    public func isThereAVehicleWithActiveParkingShift(plate: String) throws -> Bool {
        let pakingsSaved = try getFetchActiveParkingShifts()
        return pakingsSaved.first(where: {$0.plate == plate}) != nil
    }

    public func getFetchActiveParkingShifts() throws -> [ParkingShiftDataBaseEntity] {
        let parkingShiftsSaved = try dataBaseManager.getFetchCurrentParking()
        return parkingShiftsSaved
    }

    private func fetchParkingShift(withPlate plate: String) throws -> [ParkingShiftDataBaseEntity] {
        let parkingShiftsSaved = try dataBaseManager.getFetchCurrentParking()
        let parkingSavedWithSamePlate = parkingShiftsSaved.filter({$0.plate?.contains(plate) ?? false})
        return parkingSavedWithSamePlate
    }

    private func fetchFinalizedParkingShift(withPlate plate: String) throws -> [ParkingShiftDataBaseEntity] {
        let parkingShiftsSaved = try dataBaseManager.getFetchHistoricalParking()
        let parkingSavedWithSamePlate = parkingShiftsSaved.filter({$0.plate?.contains(plate) ?? false})
        return parkingSavedWithSamePlate
    }
}
