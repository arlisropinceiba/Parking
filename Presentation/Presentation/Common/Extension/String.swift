//
//  String.swift
//  Presentation
//
//  Created by Arlin Lisette Ropero Infante - Ceiba Software on 17/03/22.
//

import Foundation

extension String {
    func currencyInputFormatting() -> String {

        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "es_CO")
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = Locale(identifier: "es_CO").currencySymbol
        formatter.decimalSeparator = Locale(identifier: "es_CO").groupingSeparator
        formatter.maximumFractionDigits = 0
        formatter.minimumFractionDigits = 0

        var amountWithPrefix = self.cleanNumberFormat()

        // remove from String: "$", ".", ","
        var symbol = ""
        if self.contains("-") {
            symbol = "-"
        }
        let options = NSRegularExpression.MatchingOptions(rawValue: 0)
        let range = NSMakeRange(0, amountWithPrefix.count)
        guard let regex = try? NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive) else { return "..." }
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix,
                                                          options: options,
                                                          range: range,
                                                          withTemplate: "")

        let value = (amountWithPrefix as NSString).integerValue
        number = NSNumber(value: (value))

        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return (Locale(identifier: "es_CO").currencySymbol ?? "$") + "0" +
            (Locale(identifier: "es_CO").groupingSeparator ?? ".") + "0"
        }

        return symbol + formatter.string(from: number)!
    }

    func cleanNumberFormat() -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.maximumFractionDigits = 0
        let value = (self as NSString).integerValue
        number = NSNumber(value: (value))
        return formatter.string(from: number)!
    }
}
