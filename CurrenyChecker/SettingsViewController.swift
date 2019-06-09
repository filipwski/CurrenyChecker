//
//  SecondViewController.swift
//  CurrenyChecker
//
//  Created by Filip Skibiński on 02/06/2019.
//  Copyright © 2019 Filip Skibiński. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //MARK: - Properties
    @IBOutlet weak var currencyPicker: UIPickerView!
    let availableCurrencies = ["test1", "test2", "test3"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }


}

//MARK: - Picker settings
extension SettingsViewController {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return availableCurrencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: availableCurrencies[row], attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}


//MARK: - UI Settings
extension SettingsViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

