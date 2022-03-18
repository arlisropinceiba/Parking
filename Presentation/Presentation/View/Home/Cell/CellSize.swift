//
//  CellSize.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 18/03/22.
//

import UIKit

class CellSize {
    static var shared: CGFloat = {
        let numberOfVehiclesToShowByRow: CGFloat = UIDevice.current.orientation.isLandscape ? 8.0:4.0
        let widthView = UIScreen.main.bounds.width
        let widthCell = ((widthView - 20) / numberOfVehiclesToShowByRow) - 10
        return widthCell
    }()
    private init() {}
}
