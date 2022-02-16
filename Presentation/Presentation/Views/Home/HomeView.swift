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
    @IBOutlet weak var scroll: UIScrollView!
    
    // MARK: Properties
    var updateTimer: Clock = Clock()
    var presenter: HomePresenterProtocol?
    var date: Date = Date().localDate
    var vehicles: [VehicleVisible] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.register(UINib(nibName: "VehicleCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "VehicleCollectionViewCell")
        setWatch()
        presenter?.loadData(date.inHourDateFormat(), withThisType: .car)
    }
    
    //MARK: Collection
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vehicles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let vehicle = vehicles[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VehicleCollectionViewCell", for: indexPath) as! VehicleCollectionViewCell
        cell.setData(ofThis: vehicle, withThisDate: date, inWindowWidth: scroll.frame.width)
        return cell
    }
    
    //MARK: Action buttons
    
    @IBAction func addVehicle(_ sender: UIButton) {
        let plate: String = randomString(length: 3) + randomNumber(length: 3)
        let vehicle = CarVisible(plate: plate, admissionDate: date)
        presenter?.createShift(vehicle: vehicle)
    }
    
    @IBAction func selectVehicle(_ sender: UIButton) {
        
    }
    
    @IBAction func advanceTime(_ sender: UIButton) {
        let date = Calendar.current.date(byAdding: .hour, value: 1, to: self.date)
        self.date = date ?? Date()
        presenter?.refreshData(in: self.date.inHourDateFormat(), with: vehicles)
    }
    
    @IBAction func showTariffs(_ sender: UIButton) {
        
    }
    
    // MARK: Refresh
    
    func refreshCollection(with data: [VehicleVisible]){
        vehicles = data
        collection.reloadData()
    }
    
    // MARK: Set
    func setTimeLabelText(text: String) {
        timeLabel.text = text
    }
    
    func setCounterLabelText(text: String) {
        counterLabel.text = text
    }
    
    // MARK: Alert
    
    func showAlert(message: String){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
            let alert = UIAlertController(title: "¡Lo sentimos!", message: message, preferredStyle:  UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: Clock
    
    func setWatch(){
        updateTimer.start {[self] _ in addSecondToWatch ()}
    }
    
    func addSecondToWatch(){
        date = Calendar.current.date(byAdding: .second, value: 1, to: self.date) ?? Date()
        timeLabel.text = date.inHourDateFormat()
        collection.reloadData()
        view.layoutIfNeeded()
    }
    
    func randomString(length: Int) -> String {
      let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    func randomNumber(length: Int) -> String {
      let letters = "0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
}

