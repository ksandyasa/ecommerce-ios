//
//  DetailVC.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 24/01/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit


class DetailVC: UIViewController, DetailDelegate {
    
    @IBOutlet weak var detailList: UITableView!
    
    let detailDataSource = DetailDataSource()
    
    lazy var viewModel: DetailViewModel = {
        let viewModel = DetailViewModel(dataSource: detailDataSource)
        
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.detailList.register(UINib(nibName: "DetailImageCell", bundle: nil), forCellReuseIdentifier: "DetailImageCell")
        self.detailList.register(UINib(nibName: "DetailTitleCell", bundle: nil), forCellReuseIdentifier: "DetailTitleCell")
        self.detailList.register(UINib(nibName: "DetailDescCell", bundle: nil), forCellReuseIdentifier: "DetailDescCell")
        self.detailList.register(UINib(nibName: "DetailBottomCell", bundle: nil), forCellReuseIdentifier: "DetailBottomCell")
        
        self.viewModel.loadDetail()
        
        self.detailList.dataSource = self.detailDataSource
        self.detailList.delegate = self.detailDataSource
        self.detailList.tableFooterView = UIView.init(frame: CGRect.zero)
        
        self.detailDataSource.data.addAndNotify(self, completionHandler: { [weak self] in
            self?.detailDataSource.delegate = self
            self?.detailList.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func notifyAlreadyPurchased() {
        let warningAlert = UIAlertController(title: "", message: "Already purchased", preferredStyle: .alert)
        warningAlert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: ""), style: .default, handler: {action in}))
        present(warningAlert, animated: true, completion: nil)
    }
    
    func notfiyPurchased() {
        let warningAlert = UIAlertController(title: "", message: "Purchased", preferredStyle: .alert)
        warningAlert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: ""), style: .default, handler: {action in}))
        present(warningAlert, animated: true, completion: nil)
    }
    
    func shareDetailProduct(title: String) {
        let sharedObjects = [title as AnyObject]
        let shareController = UIActivityViewController(activityItems: sharedObjects, applicationActivities: nil)
        shareController.popoverPresentationController?.sourceView = self.view
        shareController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop]
        self.present(shareController, animated: true, completion: nil)
    }
    
}
