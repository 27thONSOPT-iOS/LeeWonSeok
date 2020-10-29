//
//  ViewController.swift
//  SOPT27_week2_assignment
//
//  Created by 이원석 on 2020/10/20.
//

import UIKit

// scrollViewDidScroll에서 scrollview를 사용하기 위해 UIScrollViewDelegate를 Delegate
class ViewController: UIViewController,UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var toTopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toTopButton.isHidden = true // 스크롤 뷰가 처음 나올 때 버튼은 없어야 함
        scrollView.delegate = self // 사용할 scrollview에 처음 view가 생성되어 진입할 때 delegate 함
        // Do any additional setup after loading the view.
    }
    
    // contentOffset의 y축이 scrollview전체 길이의 1/3 이상을 넘어갔을 경우
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y > (scrollView.contentSize.height - scrollView.frame.size.height) / 3){
            toTopButton.isHidden = false // 버튼을 보이게 함
        }
        else{
            toTopButton.isHidden = true // 그렇지 않으면 버튼 숨김
        }
    }
    
    // 버튼 클릭 시
    @IBAction func ToTheTop(_ sender: Any) {
        toTopButton.isHidden = true // 버튼을 숨기고
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true) // 최상단으로 이동
    
    }
}

