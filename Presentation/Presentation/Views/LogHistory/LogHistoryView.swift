//
//  LogHistoryView.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//  
//

import Foundation
import UIKit

class LogHistoryView: BaseController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var vehiclesListButton: UIButton!
    
    // MARK: Properties
    var presenter: LogHistoryPresenterProtocol?
    var currentType: VehicleType = .car
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureListButton()
        table.register(UINib(nibName: "LogItemTableViewCell", bundle: Bundle.main),forCellReuseIdentifier: "LogItemTableViewCell")
    }
    
    @IBAction func comeBack(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    // MARK: Vehicle menu
    
    func configureListButton() {
        vehiclesListButton.menu = vehicleMenu
        vehiclesListButton.showsMenuAsPrimaryAction = true
    }
    
    var vehicleMenuItems: [UIAction] {
        var itemsMenu: [UIAction] = []
        for type in VehicleType.allCases {
            let item = UIAction(title: type.rawValue, handler: {_ in self.actionItemVehicleType(vehicleType: type)})
            itemsMenu.append(item)
        }
        return itemsMenu
    }
    
    var vehicleMenu: UIMenu {
        return UIMenu(title: "", image: nil, identifier: nil, options: [], children: vehicleMenuItems)
    }
    
    func actionItemVehicleType(vehicleType: VehicleType){
        vehiclesListButton.setTitle("  \(vehicleType.rawValue)", for: .normal)
        currentType = vehicleType
//        presenter?.loadData(withThisType: currentType)
    }
}

extension LogHistoryView: LogHistoryViewProtocol {
    // TODO: implement view output methods
}
