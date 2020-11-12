//
//  AlreadyLoginVC.swift
//  SOPT27_week4_assignment
//
//  Created by 이원석 on 2020/11/07.
//

import UIKit

class AlreadyLoginVC: UIViewController {
    
    static let identifier = "AlreadyLoginVC"
    
    @IBOutlet weak var partNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    var partName: String?
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 화면에 표시 될 때마다 호출 되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        if let partTextField = partName {
            partNameLabel.text = partTextField
            partNameLabel.sizeToFit()
        }
        if let userNameTextField = userName {
            userNameLabel.text = "\(userNameTextField)님 안녕하세요🙋🏽‍♂️"
            userNameLabel.sizeToFit()
        }
    }
    
    @IBAction func touchUpLogin(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "LoginVC") else {
            return
        }
        self.present(dvc, animated: true, completion: nil)
    }
    
}
