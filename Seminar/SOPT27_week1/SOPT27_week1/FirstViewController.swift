//
//  FirstViewController.swift
//  Sopt_week1
//
//  Created by 이원석 on 2020/10/10.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var updateStateLabel: UILabel!
    
    @IBOutlet var updateIntervalLabel: UILabel!
    
    @IBOutlet var updateStateSwitch: UISwitch!
    
    
    @IBOutlet var updateIntervalStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func valueChangedSwitch(_ sender: UISwitch) {
        if sender.isOn {
            self.updateStateLabel.text = "자동 갱신"
        }
        else {
            self.updateStateLabel.text = "수동 갱신"
        }
    }
    
    @IBAction func valueChangedStepper(_ sender: UIStepper) {
        updateIntervalLabel.text = "\(Int(sender.value)) 분마다"
    }
    
    
    @IBAction func touchUpSubmit(_ sender: Any) {
        guard let dvc = self.storyboard?.instantiateViewController(identifier:
        "ResultViewController") as? ResultViewController else { return
        }
        // 결과 화면에 데이터를 전달
        dvc.email = self.emailTextField.text
        dvc.isAutoUpdate = self.updateStateSwitch.isOn
        dvc.updateInterval = Int(self.updateIntervalStepper.value) // modal 스타일 변경
        dvc.modalPresentationStyle = .fullScreen
        
        self.present(dvc, animated: true, completion: nil)
    }
//        if let dvc = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController {
//
//            dvc.email = self.emailTextField.text
//            dvc.isAutoUpdate = self.updateStateSwitch.isOn
//            dvc.updateInterval = Int(updateIntervalStepper.value)
//
//            self.present(dvc, animated: true, completion: nil)
//        }
        
    /*
     @IBAction func valueChangedStepper(_ sender: Any) {
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
