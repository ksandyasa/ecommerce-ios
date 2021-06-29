//
//  TabBarVC.swift
//  EcommerceApp
//
//  Created by Aprido Sandyasa on 03/02/20.
//  Copyright © 2020 Aprido Sandyasa. All rights reserved.
//

import Foundation
import UIKit


class TabBarVC: UIViewController, UITabBarDelegate {
    
    @IBOutlet weak var mainTabBar: UITabBar!
    @IBOutlet weak var mainContent: UIView!
    @IBOutlet weak var mainTopBar: UIView!
    @IBOutlet weak var mainSearchBar: RoundCornerTextField!
    @IBOutlet weak var homeTabBarItem: UITabBarItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resizeTabBarFont()
        addTopBorderToTabBar()
        
        self.tabBar(self.mainTabBar, didSelect: self.homeTabBarItem)
        self.mainSearchBar = Util.shared.setLeftImageViewOnTextField(textField: self.mainSearchBar, image: UIImage(named: "icon_search")!)
        
        let searchTap = UITapGestureRecognizer(target: self, action: #selector(showSearchView))
        self.mainTopBar.addGestureRecognizer(searchTap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    private func resizeTabBarFont() {
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont(name: "HelveticaNeue-Medium", size: 17)]
        appearance.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
    }
    
    private func addTopBorderToTabBar() {
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.5))
        lineView.backgroundColor = UIColor.black
        self.mainTabBar.addSubview(lineView)
    }
    
    private func setupHomeContentView() {
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeVC") as! HomeVC
        self.addChild(homeVC)
        homeVC.view.frame = self.mainContent.bounds
        self.mainContent.addSubview(homeVC.view)
        homeVC.didMove(toParent: self)
    }
    
    private func showPurchaseView() {
        let purchaseVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PurchaseVC") as! PurchaseVC
        self.navigationController?.pushViewController(purchaseVC, animated: true)
    }
    
    @objc func showSearchView() {
        print("showSearchView")
        let searchVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        self.navigationController?.pushViewController(searchVC, animated: true)
    }
    
    /*
     MARK: TabBarVC UITabBar Delegate Implementation
     */
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if (item.tag == 10) {
            self.setupHomeContentView()
        } else if (item.tag == 13) {
            self.showPurchaseView()
        }
    }
 
}
