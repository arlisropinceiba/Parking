//
//  HomeView.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 9/02/22.
//

import UIKit

class HomeView: BaseController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var menu: UIMenu!
    @IBOutlet weak var vehiclesListButton: UIButton!
    @IBOutlet weak var plateTextfield: UITextField!
    @IBOutlet weak var addVehiclesButton: UIButton!
    
    // MARK: Properties
    var updateTimer: Clock = Clock()
    var presenter: HomePresenterProtocol?
    var date: Date = Date()
    var vehicles: [VehicleVisible] = []
    var currentType: VehicleType = .car
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: "VehicleCollectionViewCell",
                                  bundle: Bundle.main),
                            forCellWithReuseIdentifier: "VehicleCollectionViewCell")
        configureListButton()
        setWatch()
        presenter?.loadData(date.inHourDateFormat(), withThisType: .car)
        plateTextfield.accessibilityIdentifier = "PlateFinder"
        vehiclesListButton.accessibilityIdentifier = "VehiclesListButton"
    }
    
    //MARK: Collection
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
            presenter?.finishShift(vehicle: vehicle, withThisType: currentType)
        }
        self.present(modal, animated: true)
    }
    
    //MARK: Action buttons
    @IBAction func addVehicle(_ sender: UIButton) {
        let modal = AddVehicleModal(nibName: "AddVehicleModal", bundle: nil)
        modal.vehicleType = currentType
        modal.admissionDate = date
        modal.completionWithValues = { [self] vehicle in
            presenter?.createShift(vehicle: vehicle, withThisType: currentType)
        }
        self.present(modal, animated: true)
    }
    
    @IBAction func showLogHistory(_ sender: UIButton) {
        presenter?.showLogHistory()
    }
    
    @IBAction func searchByPlate(_ sender: UIButton) {
        presenter?.searchBy(plate: plateTextfield.text ?? "", withThisType: currentType)
    }
    
    // MARK: Refresh
    func refreshCollection(with data: [VehicleVisible]) {
        vehicles = data
        collection.reloadData()
    }
    
    // MARK: Set
    func setTimeLabelText(text: String) {
        timeLabel.text = text
    }
    
    func setCounterLabelText(text: String) {
        counterLabel.text = currentType.rawValue + ": " + text
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
        updateTimer.start {[self] _ in addSecondToWatch ()}
    }
    
    func addSecondToWatch() {
        date = Calendar.current.date(byAdding: .second, value: 1, to: self.date) ?? Date()
        setTimeLabelText(text: date.inHourDateFormat())
        collection.reloadData()
        view.layoutIfNeeded()
    }
    
    // MARK: Vehicle menu
    
    func configureListButton() {
        vehiclesListButton.configureVehicleListButton(handler: { [self] vehicleType in
            actionItemVehicleType(with: vehicleType)
        })
    }
    
    func actionItemVehicleType(with vehicleType: VehicleType) {
        vehiclesListButton.setTitle("  \(vehicleType.rawValue)", for: .normal)
        currentType = vehicleType
        presenter?.loadData(date.inHourDateFormat(), withThisType: currentType)
    }
    
    // MARK: PaymentModal
    
    func showPayment(vehicle: VehicleVisible) {
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            let modal = PaymentModal(nibName: "PaymentModal", bundle: nil)
            modal.vehicle = vehicle
            self.present(modal, animated: true)
        }
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}

