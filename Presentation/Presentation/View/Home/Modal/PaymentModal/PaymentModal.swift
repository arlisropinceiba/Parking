//
//  PaymentModal.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 17/02/22.
//

import UIKit

typealias UIViewPaymentModal = UIViewController & PaymentModal

protocol PaymentModal {
    var vehicle: VehicleVisible { get set }
}


