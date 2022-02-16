//
//  PresentationErrors.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 15/02/22.
//

public enum PresentationErrors: Error {
    case ErrorSavingParking(message: String = "No fue posible agregar el servicio.")
    case ErrorFetchParkings(message: String = "No fue posible traer los registros.")
}
