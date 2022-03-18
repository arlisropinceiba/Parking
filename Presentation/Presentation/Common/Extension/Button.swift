//
//  Button.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//

import UIKit

extension UIButton {

    func configureVehicleListButton(handler: @escaping (VehicleTypeElements) -> Void) {
        self.menu = setMenu(handler: handler)
        self.showsMenuAsPrimaryAction = true
    }

    private func setVehicleMenuItems(handler: @escaping (VehicleTypeElements) -> Void) -> [UIAction] {
        var itemsMenu: [UIAction] = []
        for type in VehicleTypeElements().allVehicleTypeCases {
            print(type.getType())
            let item = UIAction(title: type.getType(),
                                handler: {_ in handler(type)})
            itemsMenu.append(item)
        }
        return itemsMenu
    }

    private func setMenu(handler: @escaping (VehicleTypeElements) -> Void) -> UIMenu {
        return UIMenu(title: "",
                      image: nil,
                      identifier: nil,
                      options: [],
                      children: setVehicleMenuItems(handler: handler))
    }
}
