//
//  InfrastructureErrors.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

import Foundation

public enum InfrastructureErrors: Error {
    case errorSavingParking(message: String = "No fue posible agregar el servicio.")
    case errorFetchParkings(message: String = "No fue posible traer los registros.")
}
