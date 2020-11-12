//
//  CustomTabBarController.swift
//  SOPT27_week4_assignment
//
//  Created by 이원석 on 2020/11/07.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        // Do any additional setup after loading the view.
    }
    
    func setTabBar() {
        guard let userVC = self.storyboard?.instantiateViewController(identifier: "AlreadyLoginVC") as? AlreadyLoginVC, let partLeaderVC = self.storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController else {
            return
        }
        
        userVC.tabBarItem.title = "Home"
        userVC.tabBarItem.image = UIImage(systemName: "house")
        userVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        partLeaderVC.tabBarItem.title = "SOPT + NETWORKING"
        partLeaderVC.tabBarItem.image = UIImage(systemName: "paperplane")
        partLeaderVC.tabBarItem.selectedImage = UIImage(systemName: "paperplane.fill")
        
        setViewControllers([userVC, partLeaderVC], animated: true) // 배열 순서가 탭 바 순서
    }

}
