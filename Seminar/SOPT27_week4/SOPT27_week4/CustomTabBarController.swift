//
//  CustomTabBarController.swift
//  SOPT27_week4
//
//  Created by 이원석 on 2020/11/07.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabs()
        // Do any additional setup after loading the view.
    }
    
    func setTabs() {
        guard let purpleVC = self.storyboard?.instantiateViewController(identifier: "PurpleVC") as? PurpleVC,
              let yellowVC = self.storyboard?.instantiateViewController(identifier: "YellowVC") as? YellowVC else {
            return
        }
        
        purpleVC.tabBarItem.title = "Home"
        purpleVC.tabBarItem.image = UIImage(systemName: "house")
        purpleVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        yellowVC.tabBarItem.title = "Profile"
        yellowVC.tabBarItem.image = UIImage(systemName: "person")
        yellowVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        setViewControllers([purpleVC, yellowVC], animated: true) // 배열 순서가 탭 바 순서
        
    }
}
