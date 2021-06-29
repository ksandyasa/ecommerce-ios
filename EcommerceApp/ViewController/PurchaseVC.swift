//
//  PurchaseVC.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit


class PurchaseVC: UIViewController, PurchaseDelegate {
    
    @IBOutlet weak var purchaseList: UITableView!
    
    let purchaseDataSource = PurchaseDataSource()
    
    lazy var viewModel: PurchaseViewModel = {
        let viewModel = PurchaseViewModel(dataSource: purchaseDataSource)
        
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.purchaseList.register(UINib(nibName: "PurchaseCell", bundle: nil), forCellReuseIdentifier: "PurchaseCell")
        
        self.viewModel.loadPurchase()
        
        self.purchaseList.dataSource = self.purchaseDataSource
        self.purchaseList.delegate = self.purchaseDataSource
        self.purchaseList.tableFooterView = UIView.init(frame: CGRect.zero)
        
        self.purchaseDataSource.data.addAndNotify(self, completionHandler: { [weak self] in
            self?.purchaseDataSource.delegate = self
            self?.purchaseList.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func goToDetail(products: Product?) {
        print("goToDetail")
        var detailData: [Product] = [Product]()
        detailData.append(products!)
        GlobalVariable.shared.detailItem = detailData
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
