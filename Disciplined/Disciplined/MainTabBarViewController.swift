//
//  MainTabBarViewController.swift
//  Disciplined
//
//  Created by 胡雪枫 on 2020/8/1.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let item1 = UINavigationController(rootViewController: CheckViewController())
        let icon1 = UITabBarItem()
        item1.tabBarItem = icon1
        
        let item2 = UINavigationController(rootViewController: RecordViewController())
        let icon2 = UITabBarItem()
        item2.tabBarItem = icon2
        
        let controllers = [item1, item2]
        self.viewControllers = controllers
        
    }

    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
