//
//  TextField.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 16/02/22.
//

import UIKit

private var maxLengths = [UITextField: Int]()

extension UITextField {
    @IBInspectable var maxLength: Int {
        get {
            guard let l = maxLengths[self] else {
               return 150 // (global default-limit. or just, Int.max)
            }
            return l
        }
        set {
            maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    @objc func fix(textField: UITextField) {
        let text = textField.text
        textField.text = text?.prefix(maxLength).description
    }
}
