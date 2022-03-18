//
//  LogItemTableViewCell.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//

import UIKit

typealias UITableLogCell = UITableViewCell & LogItemTableViewCell

protocol LogItemTableViewCell {
    func initWithData(vehicle: VehicleVisible)
}
