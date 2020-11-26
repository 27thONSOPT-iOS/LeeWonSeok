//
//  LoginVC.swift
//  SOPT27_week6
//
//  Created by 이원석 on 2020/11/21.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // 팝업창
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인",style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @IBAction func touchUpLogin(_ sender: Any) {
        
        // textfield에 아무것도 입력이 안되어있을 수 있기에 옵셔널로 선언
        guard let emailText = emailTextField.text,
              let password = passwordTextField.text else {
            return
        }
        
        LoginService.shared.signIn(email: emailText, password: password) { (networkResult) -> (Void) in
            switch networkResult {
                case .success(let data):
                    if let data = data as? SignInData {
                        self.simpleAlert(title: "로그인 성공", message: "\(data.userName)님 로그인 성공!")
                        UserDefaults.standard.set(data.userName, forKey: "userName")
                    }

                case .requestErr(let msg):
                    if let message = msg as? String {
                        self.simpleAlert(title: "로그인 실패", message: message)
                    }
                    print("requestErr")
                case .pathErr:
                    print("pathErr")
                case .serverErr:
                    print("serverErr")
                case .networkFail:
                    print("networkFail")
        }
        
        }
        
    }
}
