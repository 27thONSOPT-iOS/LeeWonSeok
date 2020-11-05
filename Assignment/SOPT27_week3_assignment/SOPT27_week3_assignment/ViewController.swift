//
//  ViewController.swift
//  SOPT27_week3_assignment
//
//  Created by 이원석 on 2020/11/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var week3CollectionView: UICollectionView!
    
    //데이터를 담기 위한 배열 선언
    var userdataList : [UserData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setData()
        week3CollectionView.delegate = self
        week3CollectionView.dataSource = self
    }
    
    // 데이터 담기 주섬주섬
    func setData()
    {
        userdataList.append(contentsOf: [
            UserData(name: "이주혁", imageName: "juhyeok", contents: "#hereis #아요 #내꿈은 #사과농장 #ENFP"),
            UserData(name: "김나연", imageName: "nayeon", contents: "#이제막학기 #여러분들이랑_친해지고_싶어요#번개스터디환영"),
            UserData(name: "손평화", imageName: "peace", contents: "#핸드피쓰 #이너피쓰 #배꼽도둑#헬린이 #sson_peace7"),
            UserData(name: "유희수", imageName: "heesoo", contents: "#총무꿈나무 #유총무 #현재_소식중 #풉"),
            UserData(name: "박세은", imageName: "saeeun", contents: "#마 #아요는 #처음입니다"),
            UserData(name: "한울", imageName: "wool", contents: "#ENFP #STORM #울크박스 #@hwooolll #하늘콜렉터"),
            UserData(name: "김한솔", imageName: "hansol", contents: "#고객중심#고객행동데이터기반한#UX디자이너#워너비,,"),
            UserData(name: "배민주", imageName: "minju", contents: "#디팟장 #개자이너 #최종목표는행복"),
            UserData(name: "최영훈", imageName: "younghun", contents: "#서팟짱 #솝트3회차 #앱잼_요리_개발자 #UX/UI"),
            UserData(name: "강민구", imageName: "minguru", contents: "#밍맹 #안팟장 #이래뵈도_귀여운거좋아함 #지박령 #허당"),
            UserData(name: "이정연", imageName: "yeonjeong", contents: "#플레이스픽 #ENFJ #기획_디자인_개발_다"),
            UserData(name: "홍준엽", imageName: "junyeop", contents: "#26기서버 #27기웹 #샵이_두개면_어떻게될까? ##")
        ])
        
    }
}

// 아직 미사용
extension ViewController: UICollectionViewDelegate {
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userdataList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let week3cell = collectionView.dequeueReusableCell(withReuseIdentifier: "week3CollectionCell", for: indexPath) as? week3CollectionCell else { return UICollectionViewCell() }
        
        week3cell.setUserData(name: userdataList[indexPath.row].name, imageName: userdataList[indexPath.row].imageName, contents: userdataList[indexPath.row].contents)
        
        return week3cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // 셀의 넓이, 높이 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.week3CollectionView.frame.width - 50) / 2
        
        return CGSize(width: width, height: 240)

    }
    
    // 셀 margin 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 41, left: 17, bottom: 0, right: 17)
    }

}

