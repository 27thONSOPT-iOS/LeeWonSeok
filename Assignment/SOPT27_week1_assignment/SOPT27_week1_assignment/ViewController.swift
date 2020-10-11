//
//  ViewController.swift
//  week1_homework
//
//  Created by 이원석 on 2020/10/11.
//

import UIKit

class ViewController: UIViewController {

    // 값을 화면에 표시하기 위한 Outlet 변수들
    @IBOutlet weak var partNameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    // 값을 직접 전달받을 변수 선언
    var partName: String?
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setLabel()
        // Do any additional setup after loading the view.
    }
    
//
//    func setLabel() {
//        if let partName = self.partName,
//           let userName = self.userName{
//
//            self.partNameLabel.text = partName
//            self.partNameLabel.sizeToFit()
//            self.userNameLabel.text = "\(userName)님 안녕하세요~"
//            self.userNameLabel.sizeToFit()
//        }
//    }
    
    // 화면에 표시 될 때마다 호출 되는 메소드
    override func viewWillAppear(_ animated: Bool) {
        if let partTextField = partName {
            partNameLabel.text = partTextField
            partNameLabel.sizeToFit()
        }
        if let nameTextField = userName {
            userNameLabel.text = "\(nameTextField)님 안녕하세요🙋🏽‍♂️"
            userNameLabel.sizeToFit()
        }
    }
    
    @IBAction func touchUpLogin(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") else {
            return
        }
        self.present(dvc, animated: true, completion: nil)
    }
    
}

