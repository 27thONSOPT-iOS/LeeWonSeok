//
//  LoginVC.swift
//  SOPT27_week4_assignment
//
//  Created by 이원석 on 2020/11/07.
//

import UIKit

class LoginVC: UIViewController{
    static let identifier = "LoginVC"
    
    @IBOutlet weak var LoginView: UIView!
    @IBOutlet weak var inputViewBottomAnchor: NSLayoutConstraint!
    @IBOutlet weak var partTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        partTextField.delegate = self
        userNameTextField.delegate = self
        setupNotification()
    }
    
    // 로그인 버튼
    // 우리가 입력받은 텍스트를 표시해주고 싶은 뷰컨이 탭바 컨트롤러의 '0'번 인덱스라는것을 기억
    @IBAction func touchUpLogin(_ sender: Any) {
        guard let tabBarController = self.presentingViewController as? UITabBarController else { return }
                
        guard let AlVC = tabBarController.viewControllers![0] as? AlreadyLoginVC else {
                    return
                }
        AlVC.partName = self.partTextField.text
        AlVC.userName = self.userNameTextField.text
        
        self.dismiss(animated: false, completion: nil)
        }
}
        // presentingViewController 속성을 통해 이전 화면 객체를 읽어온 다음, ViewController 타입으로 캐스팅한다
        //let preVc = self.presentingViewController
        
//        guard let information = self.presentingViewController as? AlreadyLoginVC else {
//                    return
//                }
//        information.partName = self.partTextField.text
//        information.userName = self.userNameTextField.text
        
        // 이전 화면으로 복귀한다
//        self.presentingViewController?.dismiss(animated: true, completion: nil)
        
        //self.dismiss(animated: true, completion: nil)


extension LoginVC: UITextFieldDelegate {
    func setupNotification() {
        // NotificationCenter를 이용해서 키보드의 up, down 상태를 알려줌
        // 키보드가 이제 보여질거야! 하면 옵저버에게 알려주고, selector에 있는 함수가 실행
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc
    func keyboardWillShow(_ sender: Notification) {
        
        UIView.animate(withDuration: 1.0, animations: {
            self.LoginView.transform = CGAffineTransform(translationX: 0, y: -90)
        })

    }
    
    @objc
    func keyboardWillHide(_ sender: Notification) {
        UIView.animate(withDuration: 1.0, animations: {
            self.LoginView.transform = CGAffineTransform(translationX: 0, y: 0)
        })
    }
    
    // 탭한 텍스트 필드는 최초 반응자(FirstResponder)가 됨
    // 텍스트 필드가 최초 반응자가 되면 시스템은 자동으로 키보드를 표시하고 입력을 텍스트 필드에 바인딩
    // 따라서 지정된 최초 반응자를 사임(resign)하면 키보드가 내려감
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        partTextField.resignFirstResponder()
        userNameTextField.resignFirstResponder()

        return true
    }

}
