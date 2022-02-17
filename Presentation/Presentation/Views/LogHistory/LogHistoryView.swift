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
    @IBOutlet weak var searchTextField: UITextField!
    
    // MARK: Properties
    var presenter: LogHistoryPresenterProtocol?
    var currentType: VehicleType = .car
    var vehicles: [VehicleVisible] = []
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureListButton()
        table.register(UINib(nibName: "LogItemTableViewCell", bundle: Bundle.main),forCellReuseIdentifier: "LogItemTableViewCell")
        presenter?.loadData(withThisType: currentType)
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
    
    //MARK: Action button
    @IBAction func searchByPlate(_ sender: UIButton) {
        
    }
    
    // MARK: Refresh
    
    func refreshTable(with data: [VehicleVisible]){
        vehicles = data
        table.reloadData()
    }
    
    // MARK: Vehicle menu
    
    func configureListButton() {
        vehiclesListButton.configureVehicleListButton(handler: { [self] vehicleType in actionItemVehicleType(with: vehicleType)})
    }
    
    func actionItemVehicleType(with vehicleType: VehicleType){
        vehiclesListButton.setTitle("  \(vehicleType.rawValue)", for: .normal)
        currentType = vehicleType
        presenter?.loadData(withThisType: currentType)
    }
    
    // MARK: Alert
    func showAlert(message: String){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            let alert = UIAlertController(title: "¡Lo sentimos!", message: message, preferredStyle:  UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension LogHistoryView: LogHistoryViewProtocol {
    // TODO: implement view output methods
}
