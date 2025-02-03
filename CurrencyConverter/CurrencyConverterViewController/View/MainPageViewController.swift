//
//  MainPageViewController.swift
//  CurrencyConverter
//
//  Created by Rohit More on 01/02/25.
//

import UIKit

class MainPageViewController: UIViewController {

    @IBOutlet private weak var lblScreenTitle: UILabel!
    @IBOutlet weak var tblContainer: UIView!
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var txtEnterAmount: UITextField!
    @IBOutlet private weak var lblCurrencyFrom: UILabel!
    @IBOutlet private weak var lblCurrencyTo: UILabel!
    @IBOutlet private weak var lblResult: UILabel!
    @IBOutlet private weak var tblView: UITableView!
    private let defaultValue = "100"
    private var countryList: [CurrencyList]?
    private var viewModel: CurrencyConversionViewModel?
    
    private var didSelectFromCurrency: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setViewColor()
        self.setUpTableView()
        self.setUpLabel()
        self.defaultAPICall()
    }
    
    private func setUpView() {
        self.countryList = SupportingCurrency.getSupportingCurrencyList()
        if viewModel == nil { viewModel = CurrencyConversionViewModel()}
        viewModel?.delegate = self
        self.txtEnterAmount.setPlaceholderColor(.white)
        self.txtEnterAmount.becomeFirstResponder()
        self.txtEnterAmount.text = defaultValue
        setUpTableView()
    }
    
    private func setViewColor() {
        self.view.backgroundColor = UIColor.backgroundColor
        self.containerView.backgroundColor = UIColor.backgroundColor1
    }
    
    private func setUpTableView() {
        self.tblContainer.isHidden = true
        let nib = UINib(nibName: .countryListTableViewCell, bundle: nil)
        self.tblView.register(nib, forCellReuseIdentifier: .countryCell)
        self.tblView.delegate = self
        self.tblView.dataSource = self
    }
    
    private func setUpLabel() {
        if let countryList = countryList {
            self.lblCurrencyFrom.text = countryList[0].currency
        }
        
        self.lblCurrencyFrom.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelCurrencyFromTapped))
        self.lblCurrencyFrom.addGestureRecognizer(tapGesture)
        
        self.lblCurrencyTo.isUserInteractionEnabled = true
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(labelCurrencyToTapped))
        self.lblCurrencyTo.addGestureRecognizer(tapGesture1)
    }
    
    @objc func labelCurrencyFromTapped() {
        self.didSelectFromCurrency = true
        self.toggle()
    }
    
    @objc func labelCurrencyToTapped() {
        self.didSelectFromCurrency = false
        self.toggle()
    }
    
    private func toggle(){
        DispatchQueue.main.async {
            if self.tblContainer.isHidden {
                self.tblContainer.isHidden = false
                self.view.bringSubviewToFront(self.tblContainer)
            } else {
                self.tblContainer.isHidden = true
                self.view.sendSubviewToBack(self.tblContainer)
            }
        }
    }
}

extension MainPageViewController {
    // MARK: call API
    private func convertAPICall() async {
        if self.txtEnterAmount.text == "0" {
            popAlert("Conversion alert", .amountValidationMessage)
        } else {
            if let text = self.txtEnterAmount.text, let number = Int(text) {
                await self.viewModel?.convertCurrency(self.lblCurrencyFrom.text ?? "",
                                                      self.lblCurrencyTo.text ?? "",
                                                      number)
            } else {
                popAlert("Conversion alert", .amountValidationMessage)
            }
        }
    }
    
    private func defaultAPICall() {
        Task{
            await self.convertAPICall()
        }
    }
}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: UITableView Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let countryList = countryList{
            return countryList.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: .countryCell, for: indexPath) as? CountryListTableViewCell else {
                return UITableViewCell()
            }
        if let countryList = countryList {
            cell.setDetails(lable: countryList[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let countryList = countryList {
            if didSelectFromCurrency {
                self.lblCurrencyFrom.text = countryList[indexPath.row].currency
            } else {
                self.lblCurrencyTo.text = countryList[indexPath.row].currency
                self.defaultAPICall()
            }
        }
        
        self.toggle()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
}

extension MainPageViewController: CurrencyConversionDelegate {
    func didCompleteConversion(result: CurrencyConversionModel) {
        DispatchQueue.main.async{
            self.lblResult.text = String(format: "%.2f", result.result)
        }
    }
}

extension MainPageViewController {
    func popAlert(_ title: String, _ message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alert, animated: true, completion: nil)
    }
}
