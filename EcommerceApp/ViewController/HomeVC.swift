//
//  HomeVC.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 21/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


class HomeVC: ViewController, ProductDelegate {
    
    @IBOutlet weak var productList: UITableView!
    @IBOutlet weak var categoryList: UICollectionView!
    @IBOutlet weak var profileTab: UIView!
    
    let productDataSource = ProductDataSource()
    let categoryDataSource = CategoryDataSource()
    
    lazy var viewModel: ProductViewModel = {
        let viewModel = ProductViewModel(dataSource: productDataSource, dataSource1: categoryDataSource)
        
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("viewDidLoad")
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.categoryList.register(UINib(nibName: "CategoryCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCell")
        self.productList.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")

        self.viewModel.fetchHome()

        self.categoryList.dataSource = self.categoryDataSource
        self.productList.dataSource = self.productDataSource
        self.productList.delegate = self.productDataSource
        self.productList.tableFooterView = UIView.init(frame: CGRect.zero)

        self.categoryDataSource.data.addAndNotify(self, completionHandler: { [weak self] in
            self?.categoryList.reloadData()
        })
        self.productDataSource.data.addAndNotify(self, completionHandler: { [weak self] in
            self?.productDataSource.delegate = self
            self?.productList.reloadData()
        })        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func navigateToDetail(products: Product?) {
        print("navigateToDetail")
        var detailData: [Product] = [Product]()
        detailData.append(products!)
        GlobalVariable.shared.detailItem = detailData
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
        
}
