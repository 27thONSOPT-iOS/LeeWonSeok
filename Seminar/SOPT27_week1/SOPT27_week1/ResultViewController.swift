//
//  ResultViewController.swift
//  Sopt_week1
//
//  Created by 이원석 on 2020/10/10.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var updateStateLabel: UILabel!
    @IBOutlet var updateIntervalLabel: UILabel!
    
    var email: String?
    var isAutoUpdate: Bool?
    var updateInterval: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()

        // Do any additional setup after loading the view.
    }
    
    func setLabel() {
        //Optional Binding
        if let  email = self.email,
            let isAutoUpdate = self.isAutoUpdate,
            let updateInterval = self.updateInterval{
            
            //Label에 값을 대입
            self.emailLabel.text = email
            self.emailLabel.sizeToFit()
            
            self.updateStateLabel.text = isAutoUpdate ? "On" : "Off"
            self.updateIntervalLabel.text = "\(updateInterval)분"
        }
    }
    
    @IBAction func touchUpBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
