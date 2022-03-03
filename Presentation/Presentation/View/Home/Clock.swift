//
//  Clock.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 11/02/22.
//
import Foundation

class Clock: ObservableObject {
    var timer: Timer = Timer()

    func start(completion: @escaping (Timer) -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: completion)
    }
}
