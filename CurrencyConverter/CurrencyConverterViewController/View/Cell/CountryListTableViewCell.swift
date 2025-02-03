//
//  CountryListTableViewCell.swift
//  CurrencyConverter
//
//  Created by Rohit More on 02/02/25.
//

import UIKit

class CountryListTableViewCell: UITableViewCell {
    @IBOutlet private weak var lblCountry: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setDetails(lable: CurrencyList) {
        self.lblCountry.text = lable.currency + ":" + " " + lable.country
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
