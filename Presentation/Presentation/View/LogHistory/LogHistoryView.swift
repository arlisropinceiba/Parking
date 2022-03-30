//
//  LogHistoryView.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//  
//

import Foundation
import UIKit

class LogHistoryView: BaseController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    // MARK: Properties
    var viewConfiguration: LogHistoryViewConfiguration = LogHistoryViewConfiguration()
    var presenter: LogHistoryPresenterProtocol?
    var currentType: VehicleTypeElements = CarElements()
    var vehicles: [VehicleVisible] = []
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(viewConfiguration.getView())
        viewConfiguration.searchVehiclesButton.addTarget(self, action: #selector(searchByPlate(_:)), for: .touchUpInside)
        viewConfiguration.backButton.addTarget(self, action: #selector(comeBack(_:)), for: .touchUpInside)
        configureListButton()
        viewConfiguration.table.delegate = self
        viewConfiguration.table.dataSource = self
        VehicleTypeElements().allLogTableCell.forEach { cellType in
            viewConfiguration.table.register(cellType, forCellReuseIdentifier: cellType.debugDescription())
        }
        viewConfiguration.plateTextfield.delegate = self
        presenter?.loadData(withThisType: currentType)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewConfiguration.frame = view.safeAreaLayoutGuide.layoutFrame
    }

    // MARK: TableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vehicle = vehicles[indexPath.row]
        currentType.setLogTableCell(tableView, indexPath)
        let cell = currentType.getLogTableCell()
        cell?.initWithData(vehicle: vehicle)
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }

    // MARK: TextField
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 6
    }

    // MARK: Action button
    @objc func searchByPlate(_ sender: UIButton) {
        presenter?.searchBy(plate: viewConfiguration.plateTextfield.text ?? "", withThisType: currentType)
    }

    @objc func comeBack(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }

        // MARK: Refresh

    func refreshTable(with data: [VehicleVisible]) {
        vehicles = data
        viewConfiguration.table.reloadData()
    }

    // MARK: Vehicle menu

    func configureListButton() {
        viewConfiguration.vehiclesListButton.configureVehicleListButton(handler: { [self] vehicleType in
            actionItemVehicleType(with: vehicleType)
        })
    }

    func actionItemVehicleType(with vehicleType: VehicleTypeElements) {
        viewConfiguration.vehiclesListButton.setTitle("  \(vehicleType.getType())", for: .normal)
        currentType = vehicleType
        presenter?.loadData(withThisType: currentType)
    }

    // MARK: Alert
    func showAlert(message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            let alert = UIAlertController(title: "¡Lo sentimos!",
                                          message: message,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

}

extension LogHistoryView: LogHistoryViewProtocol {
}
