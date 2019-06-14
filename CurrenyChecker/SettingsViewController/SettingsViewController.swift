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
    @IBOutlet weak var topLabel: UILabel!
    
    var currencies: [Currency]?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    var currency1 = "..."
    var currency2 = "..."
    
    var delegate: NewCurrencyDelegation?
    
    //MARK: - Actions
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        if currency1 == currency2 {
            return
        } else if currency1 == "..." || currency2 == "..." {
            topLabel.text = "Lacking currency"
        } else {
            currencies!.append(Currency(baseCurrencyName: currency1, targetCurrencyName: currency2))
            delegate?.newCurrencyAdded(currencies: currencies!)
            
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
    }
}

