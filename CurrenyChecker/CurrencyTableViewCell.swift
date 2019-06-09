//
//  CurrencyTableViewCell.swift
//  CurrenyChecker
//
//  Created by Filip Skibiński on 08/06/2019.
//  Copyright © 2019 Filip Skibiński. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    @IBOutlet weak var currencyImage: UIImageView!
    @IBOutlet weak var currencyName: UILabel!
    @IBOutlet weak var currencyValue: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
