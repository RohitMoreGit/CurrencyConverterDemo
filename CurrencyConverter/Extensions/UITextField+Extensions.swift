//
//  UITextField+Extensions.swift
//  CurrencyConverter
//
//  Created by Rohit More on 03/02/25.
//

import Foundation
import UIKit

extension UITextField {
    func setPlaceholderColor(_ color: UIColor) {
        guard let placeholder = self.placeholder else { return }
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color]
        )
    }
}
