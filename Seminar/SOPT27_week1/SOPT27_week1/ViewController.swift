//
//  ViewController.swift
//  Sopt_week1
//
//  Created by 이원석 on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func touchUpClick(_ sender: Any) {
        helloLabel.text = "SOPT!"
        helloLabel.sizeToFit()
    }
    
    
    @IBAction func touchUpPresent(_ sender: Any) {
        
        guard let dvc = self.storyboard?.instantiateViewController(identifier: "SecondViewController") else {
                return
        }
        
        self.navigationController?.pushViewController(dvc, animated: true)
         //completion은 화면을 띄우고 나서 뭔가를 하지 않을거면 nil
    }
}

