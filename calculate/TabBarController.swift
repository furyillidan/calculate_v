//
//  TabBarController.swift
//  calculate
//
//  Created by Neo Chou on 2019/8/29.
//  Copyright © 2019 Neo. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}

extension TabBarController : UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        
        guard let index = tabBar.items?.index(of: item) else {
            return
        }
        
    }
}
