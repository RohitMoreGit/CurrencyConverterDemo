//
//  CustomUIObjects.swift
//  CurrencyConverter
//
//  Created by Rohit More on 03/02/25.
//

import Foundation
import UIKit

@IBDesignable
class CustomLabel: UILabel {
    
    private var textStyle : UIFont.TextStyle?

    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
            layer.masksToBounds  = true
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds  = true
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds  = true
        }
    }
    @IBInspectable var roundView: Bool = true {
        didSet {
            layer.cornerRadius = frame.height / 2
            layer.masksToBounds  = true
        }
    }
}

@IBDesignable
class CustomView: UIView {
    private var textStyle : UIFont.TextStyle?

    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
            layer.masksToBounds  = true
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds  = true
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds  = true
        }
    }
    @IBInspectable var roundView: Bool = true {
        didSet {
            layer.cornerRadius = frame.height / 2
            layer.masksToBounds  = true
        }
    }
}

@IBDesignable
class CustomTabelView: UITableView {
    private var textStyle : UIFont.TextStyle?

    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
            layer.masksToBounds  = true
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds  = true
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds  = true
        }
    }
}
