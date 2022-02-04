//
//  DomainErrors.swift
//  Domain
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 4/02/22.
//

import Foundation

public enum DomainErrors: Error {
    case carLimitReached(message: String = "Has llegado al límite de cantidad de carros permitido")
    case motorcycleLimitReached(message: String = "Has llegado al límite de cantidad de motos permitido.")
    case existingPlate(message: String = "Esta placa se encuentra con un servicio abierto.")
    case invalidLicensePlateToEnter(message: String = "No es posible ingresar un carro con esa placa el día de hoy.")
    case invalidPlate(message: String = "La placa igresada no tiene un formato válido.")
    case noExistDepartureDate(message: String = "El vehículo aún esta en el parqueadero.")
    case invalidDate(message: String = "Se ha ingresado una fecha inválida")
    case invalidVehicle
    case invalidIndexInServices
}
