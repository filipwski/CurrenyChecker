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
    
    let currencyArray = ["BGN", "EUR","NZD","ILS","RUB","CAD","USD","PHP","CHF","ZAR","AUD","JPY","TRY","HKD","MYR","THB","HRK","NOK","IDR","DKK","CZK","HUF","GBP","MXN","KRW","ISK","SGD","BRL","PLN","INR","RON","CNY","SEK"].sorted()
    
    var currency1 = "..."
    var currency2 = "..."
    
    var delegate: NewCurrencyDelegation?
    
    //MARK: - Actions
    @IBAction func doneButtonPressed(_ sender: Any) {
        
        // check if already added
        
        for currency in currencies! {
            if (currency1 == currency.baseCurrencyName) && (currency2 == currency.targetCurrencyName) {
                let errorAlert = UIAlertController(title: "Error", message: "Currencies already selected", preferredStyle: .alert)
                errorAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(errorAlert, animated: true)
                return
            }
        }
        
        // check if the same or empty
        
        if currency1 == currency2 {
            let errorAlert = UIAlertController(title: "Error", message: "Same currency selected", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(errorAlert, animated: true)
            return
        } else if currency1 == "..." || currency2 == "..." {
            let errorAlert = UIAlertController(title: "Error", message: "Missing currency selection", preferredStyle: .alert)
            errorAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(errorAlert, animated: true)
            return
            
        // add
            
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

