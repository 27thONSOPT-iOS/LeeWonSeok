//
//  signupViewController.swift
//  week1_homework
//
//  Created by 이원석 on 2020/10/11.
//

import UIKit

class signupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUppop(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
