//
//  SearchVC.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 03/02/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit


class SearchVC: UIViewController, UITextFieldDelegate, SearchDelegate {
    
    @IBOutlet weak var searchBack: UIImageView!
    @IBOutlet weak var searchField: RoundCornerTextField!
    @IBOutlet weak var searchList: UITableView!
    
    let searchDataSource = SearchDataSource()
    
    lazy var viewModel: SearchViewModel = {
        let viewModel = SearchViewModel(dataSource: searchDataSource)
        
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchList.register(UINib(nibName: "PurchaseCell", bundle: nil), forCellReuseIdentifier: "PurchaseCell")
        
        self.searchList.dataSource = self.searchDataSource
        self.searchList.delegate = self.searchDataSource
        self.searchList.tableFooterView = UIView.init(frame: CGRect.zero)
        
        self.searchDataSource.data.addAndNotify(self, completionHandler: { [weak self] in
            self?.searchDataSource.delegate = self
            self?.searchList.reloadData()
        })
        
        self.searchField = Util.shared.setLeftImageViewOnTextField(textField: self.searchField, image: UIImage(named: "icon_search")!)
        
        let backTap = UITapGestureRecognizer(target: self, action: #selector(backToHome))
        searchBack.addGestureRecognizer(backTap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func goToDetail(products: Product?) {
        var detailData: [Product] = [Product]()
        detailData.append(products!)
        GlobalVariable.shared.detailItem = detailData
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailVC") as! DetailVC
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @objc func backToHome() {
        self.navigationController?.popViewController(animated: true)
    }
    
    /*
     MARK: SearchVC UITextField Delegate Implementation
     */
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.viewModel.searchProduct(keyString: textField.text!)        
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}
