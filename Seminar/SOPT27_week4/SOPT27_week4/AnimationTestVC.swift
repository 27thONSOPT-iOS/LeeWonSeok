//
//  AnimationTestVC.swift
//  SOPT27_week4
//
//  Created by 이원석 on 2020/11/07.
//

import UIKit

class AnimationTestVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func initPostion() {
        //112 75 75 133
        imageView.frame = CGRect(x: 75, y: 112, width: 240, height: 240)
    }
    
    @IBAction func animationBtn(_ sender: Any) {
//        UIView.animate(withDuration: 3.0, animations: {self.imageView.alpha = 0} )
        // frame, alpha(투명도, 사라지기 효과), bounds, transform 등 많음
        
//        UIView.animate(withDuration: 2.0, animations: {self.imageView.alpha = 0
//            self.imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        })
//        { (finish) in
//            UIView.animate(withDuration: 2,delay: 3, animations: {
//                self.imageView.alpha = 1
//                self.initPostion()
//            }) { (finished) in
//                if finished {
//                    print("finished")
//                }
//            }
//        }
        // 처음 했던 메소드와 다르게 completion이 새롭다 completion은 애니메이션이 수행 완료 된 후에 실행될 블럭을 의미
        // 하지만 오토가 잡혀있으면 frame 애니메이션이 제대로 동작되지 않음 그래서 CGAffineTransform 사용
        
        UIView.animate(withDuration: 2.0, animations: {
            // 현재 사이즈의 2배 1/2배로 변경한다는 의미
            // 오토가 잡혀있어도 애니메이션이 적용되는 것을 볼 수 있다!
//            self.imageView.transform = CGAffineTransform(scaleX: 2.0, y: 0.5)
            
            // 조절하고자하는뷰의현재x,y좌표에서이동하고싶은거리를지정
//            self.imageView.transform = CGAffineTransform(translationX: 100, y: 100)
            
            // 조절하고자 하는 뷰의 현재 각도에서 회전하고 싶은 각도만큼을 지정
//            self.imageView.transform = CGAffineTransform(rotationAngle: .pi / 2)
            
            
            // 위 3가지를 한번에 다 실행 // concatenating
            let scale = CGAffineTransform(scaleX: 0.5, y: 0.5)
            let rotate = CGAffineTransform(rotationAngle: .pi / 4)
            let move = CGAffineTransform(translationX: 50, y: 50)
            let combine = scale.concatenating(move).concatenating(rotate)
            
//            UIView.animate(withDuration: 1.0, delay: 0) {
//            self.imageView.transform = combine }
            
            // .identity로 애니메이션 종료 시 원상태로 돌아오게 할 수 있다!
            UIView.animate(withDuration: 1.0, animations: {
                self.imageView.transform = combine
            }) { finished in UIView.animate(withDuration: 1.0) {
                self.imageView.transform = .identity }
            }
            
        })
    }
}

