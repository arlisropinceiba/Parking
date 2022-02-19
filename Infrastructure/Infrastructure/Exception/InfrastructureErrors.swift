//
//  InfrastructureErrors.swift
//  Infrastructure
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 7/02/22.
//

public enum InfrastructureErrors: Error {
    case ErrorSavingParking(message: String = "No fue posible agregar el servicio.")
    case ErrorUpdatingParking(message: String = "No fue posible actualizar el servicio.")
    case ErrorFetchParkings(message: String = "No fue posible traer los registros.")
}
