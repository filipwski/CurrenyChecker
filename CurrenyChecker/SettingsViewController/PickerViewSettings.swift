//
//  PickerViewSettings.swift
//  CurrenyChecker
//
//  Created by Filip Skibiński on 11/06/2019.
//  Copyright © 2019 Filip Skibiński. All rights reserved.
//

import UIKit

extension SettingsViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 1 || component == 3 {
            return currencyArray.count
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        switch component {
        case let number where number == 1 || number == 3:
            return NSAttributedString(string: currencyArray[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        case 0:
            return NSAttributedString(string: "Add", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        default:
            return NSAttributedString(string: "in", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 1:
            currency1 = currencyArray[row]
            break
        case 3:
            currency2 = currencyArray[row]
            break
        default:
            break
        }
        
        if currency1 == currency2 {
            topLabel.text = "Same currency selected"
        } else {
            topLabel.text = "\(currency1) in \(currency2)"
        }
    }
}
