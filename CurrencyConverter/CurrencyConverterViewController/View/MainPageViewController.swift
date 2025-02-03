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
    
    private var countryList: [CurrencyList]?
    private var viewModel: CurrencyConversionViewModel?
    
    private var didSelectFromCurrency: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        self.setViewColor()
        self.setUpTableView()
        self.setUpLabel()
    }
    
    private func setUpView() {
        self.countryList = SupportingCurrency.getSupportingCurrencyList()
        if viewModel == nil { viewModel = CurrencyConversionViewModel()}
        viewModel?.delegate = self
        self.txtEnterAmount.setPlaceholderColor(.white)
        self.txtEnterAmount.becomeFirstResponder()
        setUpTableView()
    }
    
    private func setViewColor() {
        self.view.backgroundColor = UIColor.backgroundColor
        self.containerView.backgroundColor = UIColor.backgroundColor1
    }
    
    private func setUpTableView() {
        self.tblContainer.isHidden = true
        let nib = UINib(nibName: "CountryListTableViewCell", bundle: nil)
        self.tblView.register(nib, forCellReuseIdentifier: "CountryCell")
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
    private func convertAPICall() async {
        if self.txtEnterAmount.text == "0" {
        
        } else {
            if let text = self.txtEnterAmount.text, let number = Int(text) {
                await self.viewModel?.convertCurrency(self.lblCurrencyFrom.text ?? "",
                                                      self.lblCurrencyTo.text ?? "",
                                                      number)
            }
        }
    }
}

extension MainPageViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let countryList = countryList{
            return countryList.count
        }
        else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as? CountryListTableViewCell else {
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
                
                Task{
                    await self.convertAPICall()
                }
            }
        }
        
        self.toggle()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
        
    }
}

extension MainPageViewController {
    
    private func convertTimeStampToDate(timeStamp: Int) {
        let date = Date(timeIntervalSince1970: TimeInterval(timeStamp))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM, HH:MM"
        dateFormatter.timeZone = TimeZone.current // Adjust to your timezone if needed
        
        let formattedDate = dateFormatter.string(from: date)
        print(formattedDate) // Output: "26-04-2015"
    }
    
}

extension MainPageViewController: CurrencyConversionDelegate {
    func didCompleteConversion(result: CurrencyConversionModel) {
        /*debugPrint(result.query.from)
        debugPrint(result.query.to)
        debugPrint(result.query.amount)
        debugPrint(result.result)
        */
        DispatchQueue.main.async{
            self.lblResult.text = String(format: "%.2f", result.result)
        }
        
    }
}


/* if let finalURl = self.createURL(baseURL: .baseUrl + .endPoint, parameters: ["access_key":"c1d4a7a135456b3412370990ead27fbb","from":"USD", "to":"INR", "amount":3500]) {
     print(finalURl)
 } else {
     print("Invalid url")
 }
 
 private func createURL(baseURL: String, parameters: [String: Any]) -> URL? {
     guard var components = URLComponents(string: baseURL) else {
         print("Invalid base URL")
         return nil
     }
     components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value as? String) }
     
     return components.url
 }
 
 */
