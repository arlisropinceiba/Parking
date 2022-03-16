//
//  LogHistoryViewConfiguration.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/03/22.
//

import UIKit

extension LogHistoryView {

    func setView(){

        // MARK: Main Stack
        view.addSubview(mainStack)
        mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true

        // MARK: Title Button Stack
        mainStack.addArrangedSubview(titleButtonStack)

        // MARK: Title Button Stack
        titleButtonStack.addArrangedSubview(titleStack)

        // MARK: Back Button
        titleStack.addArrangedSubview(backButton)
        backButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        // MARK: Title Label
        titleStack.addArrangedSubview(titleLabel)
        
        // MARK: Blank
        titleButtonStack.addArrangedSubview(blank)
        
        // MARK: List Button
        titleButtonStack.addArrangedSubview(vehiclesListButton)
        
        // MARK: Finder Stack
        mainStack.addArrangedSubview(finderStack)

        // MARK: Plate TextField
        finderStack.addArrangedSubview(plateTextfield)

        // MARK: Search Vehicles Button
        finderStack.addArrangedSubview(searchVehiclesButton)
        searchVehiclesButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        searchVehiclesButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        // MARK: Line
        view.addSubview(line)
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        line.topAnchor.constraint(equalTo: mainStack.bottomAnchor, constant: 20).isActive = true
        line.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        
        // MARK: Table
        table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
        table.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        table.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 0).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}
