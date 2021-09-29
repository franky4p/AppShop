//
//  BasketTableViewController.swift
//  AppShop
//
//  Created by Pavel Khlebnikov on 27.09.2021.
//

import UIKit

class BasketTableViewController: UITableViewController {

    private var products = AppSession.shared.basket
    private var totalOrderAmount: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(BasketTableViewCell.self, forCellReuseIdentifier: "basketProductCellId")
    }

    override func viewWillAppear(_ animated: Bool) {
        updateViewValue()
    }
    
    private func updateViewValue() {
        //FIXME: нужен наблюдатель при обновлении корзины, чтобы обновлял вью, пока такая колхозная реализация
        products = AppSession.shared.basket
        tableView.reloadData()
        
        totalOrderAmount = products.reduce(0.0) { $0 + $1.price }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basketProductCellId", for: indexPath) as! BasketTableViewCell
        cell.product = products[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 60))
        
        let mainHeadingLabel = FactoryUI.createLabel()
        mainHeadingLabel.text = NSLocalizedString("Итого к оплате: \(totalOrderAmount ?? 0)", comment: "")
        headerView.addSubview(mainHeadingLabel)
        mainHeadingLabel.anchor(top: headerView.topAnchor, left: headerView.leftAnchor, bottom: nil, right: headerView.rightAnchor, paddingTop: 5, paddingLeft: 1, paddingBottom: 0, paddingRight: 0, width: 0, height: 40, enableInsets: false)
        
        let payButton = FactoryUI.createButton(headerView, hightY: 40)
        payButton.setTitle(NSLocalizedString("Оплатить", comment: ""), for: .normal)
        payButton.addTarget(self, action: #selector(pay), for: .touchUpInside)
        headerView.addSubview(payButton)
        
        let headingTableLabel = FactoryUI.createLabel()
        headingTableLabel.text = NSLocalizedString("Товары", comment: "")
        headingTableLabel.layer.borderWidth = 1
        headerView.addSubview(headingTableLabel)
        headingTableLabel.anchor(top: nil, left: headerView.leftAnchor, bottom: headerView.bottomAnchor, right: headerView.rightAnchor, paddingTop: 5, paddingLeft: 1, paddingBottom: 0, paddingRight: 1, width: 0, height: 0, enableInsets: false)
        
        return headerView
    }
    
    @objc private func pay() {
        guard totalOrderAmount != 0 else { return }
        
        AppSession.shared.payBasket() {
            DispatchQueue.main.async { [self] in
                let alert  = UIAlertController(title: NSLocalizedString("Оплата", comment: ""), message: NSLocalizedString("Товар оплачен", comment: "") , preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK ", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
                
                updateViewValue()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(products?[indexPath.row].name ?? "")
    }
}
