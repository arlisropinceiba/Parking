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
    var vehicles: [VehicleVisible] = []
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
        return vehicles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vehicle = vehicles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogItemTableViewCell", for: indexPath) as! LogItemTableViewCell
        cell.initWithData(vehicle: vehicle)
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: Vehicle menu
    
    func configureListButton() {
        vehiclesListButton.configureVehicleListButton(handler: { [self] vehicleType in actionItemVehicleType(with: vehicleType)})
    }
    
    func actionItemVehicleType(with vehicleType: VehicleType){
        currentType = vehicleType
//        presenter?.loadData(withThisType: currentType)
    }
}

extension LogHistoryView: LogHistoryViewProtocol {
    // TODO: implement view output methods
}
