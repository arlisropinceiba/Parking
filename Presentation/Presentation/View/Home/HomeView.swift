//
//  HomeView.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import UIKit

class HomeView: BaseController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {

    // MARK: Vars
    var viewConfiguration: HomeViewConfiguration = HomeViewConfiguration()
    var updateTimer: Clock = Clock()
    var presenter: HomePresenterProtocol?
    var date: Date = Date()
    var vehicles: [VehicleVisible] = []
    var currentType: VehicleTypeElements = CarElements()

    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(viewConfiguration.getView())
        viewConfiguration.logButton.addTarget(self, action: #selector(showLogHistory(_:)), for: .touchUpInside)
        viewConfiguration.addVehiclesButton.addTarget(self, action: #selector(addVehicle(_:)), for: .touchUpInside)
        viewConfiguration.searchVehiclesButton.addTarget(self, action: #selector(searchByPlate(_:)), for: .touchUpInside)
        viewConfiguration.collection?.delegate = self
        viewConfiguration.collection?.dataSource = self
        viewConfiguration.collection?.register(VehicleCollectionViewCell.self,
                            forCellWithReuseIdentifier: "VehicleCollectionViewCell")
        viewConfiguration.plateTextfield.delegate = self
        presenter?.loadData(date.inHourDateFormat())
        configureListButton()
        setWatch()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewConfiguration.frame = view.safeAreaLayoutGuide.layoutFrame
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
        cell?.setData(ofThis: vehicle, withThisDate: date)
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vehicle = vehicles[indexPath.row]
        let modal = FinishShiftModel(vehicle: vehicle)
        modal.completion = { [self] in
            presenter?.loadVehicleType(currentType)
            presenter?.finishShift(vehicle: vehicle)
        }
        self.present(modal, animated: true)
    }

    // MARK: TextField
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let count = text.count + string.count - range.length
        return count <= 6
    }

    // MARK: Action buttons
    @objc func addVehicle(_ sender: UIButton) {
        var modal = currentType.getAddVehicleModal()
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
        presenter?.searchBy(plate: viewConfiguration.plateTextfield.text ?? "")
    }

    // MARK: Refresh
    func refreshCollection(with data: [VehicleVisible]) {
        vehicles = data
        viewConfiguration.collection?.reloadData()
    }

    // MARK: Set
    func setTimeLabelText(text: String) {
        viewConfiguration.timeLabel.text = text
    }

    func setCounterLabelText(text: String) {
        viewConfiguration.counterLabel.text = currentType.getType() + ": " + text
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
        viewConfiguration.collection?.reloadData()
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
        presenter?.loadVehicleType(currentType)
        presenter?.loadData(date.inHourDateFormat())
    }

    // MARK: PaymentModal

    func showPayment(vehicle: VehicleVisible) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) { [self] in
            currentType.setPaymentModal(vehicle: vehicle)
            guard let modal = currentType.getPaymentModal() else { return }
            self.present(modal, animated: true)
        }
    }
}

extension HomeView: HomeViewProtocol {

}
