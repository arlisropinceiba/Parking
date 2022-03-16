//
//  HomeView.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import UIKit

class HomeView: BaseController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {

    // MARK: Vars
    var updateTimer: Clock = Clock()
    var presenter: HomePresenterProtocol?
    var date: Date = Date()
    var vehicles: [VehicleVisible] = []
    var currentType: VehicleTypeElements = CarElements()

    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        collection?.delegate = self
        collection?.dataSource = self
        collection?.register(UINib(nibName: "VehicleCollectionViewCell",
                                  bundle: Bundle.main),
                            forCellWithReuseIdentifier: "VehicleCollectionViewCell")
        plateTextfield.delegate = self
        configureListButton()
        setWatch()
        presenter?.loadData(date.inHourDateFormat())
    }

    // MARK: Collection
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return vehicles.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let vehicle = vehicles[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleCollectionViewCell",
                                                      for: indexPath) as? VehicleCollectionViewCell
        cell?.setData(ofThis: vehicle, withThisDate: date, inWindowWidth: view.frame.width)
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vehicle = vehicles[indexPath.row]
        let modal = FinishShiftModel(nibName: "FinishShiftModel", bundle: nil)
        modal.vehicle = vehicle
        modal.completion = { [self] in
            presenter?.loadVehicleType(currentType)
            presenter?.finishShift(vehicle: vehicle)
        }
        self.present(modal, animated: true)
    }

    // MARK: TextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 6
    }

    // MARK: Action buttons
    @objc func addVehicle(_ sender: UIButton) {
        var modal = currentType.getModal()
        modal.completionWithValues = { [self] vehicle in
            presenter?.loadVehicleType(currentType)
            presenter?.createShift(vehicle: vehicle)
        }
        self.present(modal, animated: true)
    }

    @objc func showLogHistory(_ sender: UIButton) {
        presenter?.showLogHistory()
    }

    @objc func searchByPlate(_ sender: UIButton) {
        presenter?.loadVehicleType(currentType)
        presenter?.searchBy(plate: plateTextfield.text ?? "")
    }

    // MARK: Refresh
    func refreshCollection(with data: [VehicleVisible]) {
        vehicles = data
        collection?.reloadData()
    }

    // MARK: Set
    func setTimeLabelText(text: String) {
        timeLabel.text = text
    }

    func setCounterLabelText(text: String) {
        counterLabel.text = currentType.getType() + ": " + text
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

    // MARK: Clock

    func setWatch() {
        updateTimer.start {[self] _ in addSecondToWatch()}
    }

    func addSecondToWatch() {
        date = Calendar.current.date(byAdding: .second, value: 1, to: self.date) ?? Date()
        setTimeLabelText(text: date.inHourDateFormat())
        collection?.reloadData()
        view.layoutIfNeeded()
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
        presenter?.loadVehicleType(currentType)
        presenter?.loadData(date.inHourDateFormat())
    }

    // MARK: PaymentModal

    func showPayment(vehicle: VehicleVisible) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            let modal = PaymentModal(nibName: "PaymentModal", bundle: nil)
            modal.vehicle = vehicle
            self.present(modal, animated: true)
        }
    }

    // MARK: View ELements
    var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        label.text = Date().inHourDateFormat()
        return label
    }()

    var counterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Carros: 0"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.systemGray
        label.backgroundColor = UIColor.systemBackground
        label.numberOfLines = 0
        return label
    }()

    var line: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.systemGray
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

    var timerButtonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 10.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var buttonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .trailing
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 13.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    var addButtonsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 15.0
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

    var menu: UIMenu = {
        let menu = UIMenu()
        return menu
    }()

    var vehiclesListButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom) as UIButton
        button.setImage(UIImage(systemName: "arrowtriangle.down.fill"), for: .normal)
        button.setTitle("  Carros", for: .normal)
        button.setTitleColor(UIColor.label, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var logButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "list.dash"), for: .normal)
        button.addTarget(self, action: #selector(showLogHistory(_:)), for: .touchUpInside)
        return button
    }()

    var addVehiclesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.setTitle("+", for: .normal)
        button.addTarget(self, action: #selector(addVehicle(_:)), for: .touchUpInside)
        button.accessibilityIdentifier = "VehiclesListButton"
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


    var collection: UICollectionView?
}

extension HomeView: HomeViewProtocol {
}
