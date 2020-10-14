//
//  LoginViewController.swift
//  week1_homework
//
//  Created by 이원석 on 2020/10/11.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 회원가입 버튼
    @IBAction func touchUpSignup(_ sender: Any) {
        guard let sgu = self.storyboard?.instantiateViewController(withIdentifier: "signupViewController") else {
            return
        }
        // 이동하는 다음 페이지("signupViewController")는 자동으로 네비게이션바, 뒤로가기버튼 생성
        self.navigationController?.pushViewController(sgu, animated: true)
    }
    
    // 로그인 버튼
    @IBAction func touchUpLogin(_ sender: Any) {
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음, ViewController 타입으로 캐스팅한다
        let preVc = self.presentingViewController
        guard let information = preVc as? ViewController else {
            return
        }
        
        //        guard let information = self.storyboard?.instantiateViewController(identifier:"ViewController") as? ViewController else {
        //            return
        //        }

        information.partName = self.partTextField.text
        information.userName = self.nameTextField.text
        
        // 이전 화면으로 복귀한다
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        //        self.dismiss(animated: true, completion: nil)
        
    }

}
