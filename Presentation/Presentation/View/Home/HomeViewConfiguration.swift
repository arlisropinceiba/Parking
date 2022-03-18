//
//  HomeViewConfiguration.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/03/22.
//

import UIKit

extension HomeView {

    func setView() {

        // MARK: Main Stack
        view.addSubview(mainStack)
        mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true

        // MARK: Timer Stack
        mainStack.addArrangedSubview(timerButtonsStack)

        // MARK: Timer Label
        timerButtonsStack.addArrangedSubview(timeLabel)

        // MARK: ButtonsStack
        timerButtonsStack.addArrangedSubview(buttonsStack)

        // MARK: Log Button
        buttonsStack.addArrangedSubview(logButton)
        logButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        logButton.widthAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: Add Buttons Stack
        buttonsStack.addArrangedSubview(addButtonsStack)

        // MARK: List Button
        addButtonsStack.addArrangedSubview(vehiclesListButton)

        // MARK: Add Button
        addButtonsStack.addArrangedSubview(addVehiclesButton)
        addVehiclesButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        addVehiclesButton.widthAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: Line
        view.addSubview(line)
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        line.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 20).isActive = true
        line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true

        // MARK: Counter Label
        view.addSubview(counterLabel)
        counterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        counterLabel.centerYAnchor.constraint(equalTo: line.centerYAnchor, constant: 0).isActive = true

        // MARK: Finder Stack
        mainStack.addArrangedSubview(finderStack)

        // MARK: Plate TextField
        finderStack.addArrangedSubview(plateTextfield)

        // MARK: Search Vehicles Button
        finderStack.addArrangedSubview(searchVehiclesButton)
        searchVehiclesButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        searchVehiclesButton.widthAnchor.constraint(equalToConstant: 35).isActive = true

        // MARK: Collection
        let widthCell = CellSize.shared
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: widthCell, height: widthCell)
//        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let frame = CGRect(x: line.frame.minX, y: line.frame.maxY, width: view.frame.width, height: 0.0)
        collection = UICollectionView(frame: frame, collectionViewLayout: layout)
        collection?.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collection?.backgroundColor = .clear
        collection?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collection ?? UICollectionView())
        collection?.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        collection?.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 0).isActive = true
        collection?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collection?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
