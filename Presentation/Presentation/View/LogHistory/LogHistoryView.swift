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
        viewConfiguration.setSelectorSearchVehiclesButton(#selector(searchByPlate(_:)))
        viewConfiguration.setSelectorBackButton(#selector(comeBack(_:)))
        configureListButton()
        viewConfiguration.getTableView().delegate = self
        viewConfiguration.getTableView().dataSource = self
        VehicleTypeElements().allLogTableCell.forEach { cellType in
            viewConfiguration.getTableView().register(cellType, forCellReuseIdentifier: cellType.debugDescription())
        }
        viewConfiguration.getPlateTextfield().delegate = self
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
        presenter?.searchBy(plate: viewConfiguration.getPlateTextfield().text ?? "", withThisType: currentType)
    }

    @objc func comeBack(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }

        // MARK: Refresh

    func refreshTable(with data: [VehicleVisible]) {
        vehicles = data
        viewConfiguration.getTableView().reloadData()
    }

    // MARK: Vehicle menu

    func configureListButton() {
        viewConfiguration.getVehiclesListButton().configureVehicleListButton(handler: { [self] vehicleType in
            actionItemVehicleType(with: vehicleType)
        })
    }

    func actionItemVehicleType(with vehicleType: VehicleTypeElements) {
        viewConfiguration.getVehiclesListButton().setTitle("  \(vehicleType.getType())", for: .normal)
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
