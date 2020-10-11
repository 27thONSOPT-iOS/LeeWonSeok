//
//  SecondViewController.swift
//  Sopt_week1
//
//  Created by 이원석 on 2020/10/10.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func touchUpClose(_ sender: UIButton) {
//        self.dismiss(animated: true, completion: nil)
        //present에서 나온 뷰를 사라지게 하는 것
        self.navigationController?.popViewController(animated: true)
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
