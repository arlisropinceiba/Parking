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
    var presenter: LogHistoryPresenterProtocol?
    var currentType: VehicleTypeElements = CarElements()
    var vehicles: [VehicleVisible] = []
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        configureListButton()
        table.delegate = self
        table.dataSource = self
        table.register(UINib(nibName: "LogItemTableViewCell", bundle: Bundle.main),
                       forCellReuseIdentifier: "LogItemTableViewCell")
        plateTextfield.delegate = self
        presenter?.loadData(withThisType: currentType)
    }

    // MARK: TableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vehicle = vehicles[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "LogItemTableViewCell",
                                                 for: indexPath) as? LogItemTableViewCell
        cell?.initWithData(vehicle: vehicle)
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }

    // MARK: TextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 6
    }

    // MARK: Action button
    @objc func searchByPlate(_ sender: UIButton) {
        presenter?.searchBy(plate: plateTextfield.text ?? "", withThisType: currentType)
    }

    @objc func comeBack(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }

        // MARK: Refresh

    func refreshTable(with data: [VehicleVisible]) {
        vehicles = data
        table.reloadData()
    }

    // MARK: Vehicle menu

    func configureListButton() {
        vehiclesListButton.configureVehicleListButton(handler: { [self] vehicleType in
            actionItemVehicleType(with: vehicleType)
        })
    }

    func actionItemVehicleType(with vehicleType: VehicleTypeElements) {
        vehiclesListButton.setTitle("  \(vehicleType.getType())", for: .normal)
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

        // MARK: ELements

    var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = "Historial"
        return label
    }()

    var line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.systemGray
        return view
    }()
    
    var blank: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var mainStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var titleButtonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 15.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var titleStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var finderStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var vehiclesListButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
        button.setTitle("  Carros", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        button.addTarget(self, action: #selector(comeBack(_:)), for: .touchUpInside)
        return button
    }()

    var searchVehiclesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.addTarget(self, action: #selector(searchByPlate(_:)), for: .touchUpInside)
        return button
    }()

    var plateTextfield: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.borderStyle = .roundedRect
        field.placeholder = "ABC123"
        field.accessibilityIdentifier = "PlateFinder"
        return field
    }()

    var table: UITableView = UITableView()
}

extension LogHistoryView: LogHistoryViewProtocol {
}
