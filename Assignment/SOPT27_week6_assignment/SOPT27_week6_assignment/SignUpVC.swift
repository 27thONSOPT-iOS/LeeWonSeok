//
//  SignUpVC.swift
//  SOPT27_week6_assignment
//
//  Created by 이원석 on 2020/11/26.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func TouchUpSignUp(_ sender: Any) {
        guard let emailText = emailTextField.text,
              let passwordText = passwordTextField.text,
              let userName = userNameTextField.text else {
            return
        }
        
    SignUpService.shared.signup(email: emailText, password: passwordText, userName: userName) { (networkResult) -> (Void) in
            
            switch networkResult {
            case .success(let data):
                if let signUpData = data as? SignInData {
                    self.simpleAlert(title: "회원가입 성공", message: "\(signUpData.userName)님 회원가입 성공!")
                    
                    UserDefaults.standard.set(signUpData.userName, forKey: "userName")
                }
                
            case .requestErr(let msg):
                if let message = msg as? String {
                self.simpleAlert(title: "회원가입 실패", message: message)
                            }
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Alert의 '확인'을 누르면 dismiss
        let okAction = UIAlertAction(title: "확인",style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }

}
