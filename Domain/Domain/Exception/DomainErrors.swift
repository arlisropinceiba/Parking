//
//  DomainErrors.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

public enum DomainErrors: Error {
    case CarLimitReached(message: String = "Has llegado al límite de cantidad de carros permitido")
    case MotorcycleLimitReached(message: String = "Has llegado al límite de cantidad de motos permitido.")
    case ExistingPlate(message: String = "Esta placa se encuentra con un servicio abierto.")
    case InvalidLicensePlateToEnter(message: String = "No es posible ingresar un carro con esa placa el día de hoy.")
    case InvalidPlate(message: String = "La placa igresada no tiene un formato válido.")
    case NoExistDepartureDate(message: String = "El vehículo aún esta en el parqueadero.")
    case InvalidDate(message: String = "Se ha ingresado una fecha inválida")
    case InvalidCylinderCapacity(message: String = "La capacidad de cilindraje debería ser mayor")
    case InvalidVehicle
    case InvalidIndexInServices
}
