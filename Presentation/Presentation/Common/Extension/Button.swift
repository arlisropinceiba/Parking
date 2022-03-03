//
//  Button.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//

import UIKit

extension UIButton {

    func configureVehicleListButton(handler: @escaping (VehicleType) -> Void) {
        self.menu = setMenu(handler: handler)
        self.showsMenuAsPrimaryAction = true
    }

    private func setVehicleMenuItems(handler: @escaping (VehicleType) -> Void) -> [UIAction] {
        var itemsMenu: [UIAction] = []
        for type in VehicleType.allCases {
            let item = UIAction(title: type.rawValue,
                                handler: {_ in handler(type)})
            itemsMenu.append(item)
        }
        return itemsMenu
    }

    private func setMenu(handler: @escaping (VehicleType) -> Void) -> UIMenu {
        return UIMenu(title: "",
                      image: nil,
                      identifier: nil,
                      options: [],
                      children: setVehicleMenuItems(handler: handler))
    }
}
