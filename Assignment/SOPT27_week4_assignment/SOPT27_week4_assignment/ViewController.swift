//
//  ViewController.swift
//  SOPT27_week3_assignment
//
//  Created by 이원석 on 2020/11/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    //@IBOutlet weak var topViewHeight: NSLayoutConstraint!
    
    //데이터를 담기 위한 배열 선언
    var userdataList : [UserData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        
        collectionView.register(week4CollectionViewCell.nib(), forCellWithReuseIdentifier: week4CollectionViewCell.identifier) // .xib 셀 등록
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
    }
    
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

extension ViewController: UICollectionViewDelegate {

    // 스크롤하면 TopView 위로 소로록
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //print("\(scrollView.contentOffset.y)")
        if scrollView.contentOffset.y > 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.topView.transform = CGAffineTransform(translationX: 0, y: -88)
                
            })
        }else {
            // 맨 위(Offset - )로 올라오면 TopView 다시 내려오게
            UIView.animate(withDuration: 0.5, animations: {
                self.topView.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
    
    // 스크롤 멈추면 소로록 내려오게
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            UIView.animate(withDuration: 0.3, animations: {
            self.topView.transform = CGAffineTransform(translationX: 0, y: 0)
            })
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userdataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "week4CollectionViewCell", for: indexPath) as? week4CollectionViewCell else {
                    return UICollectionViewCell()
                }
        
        cell.setUserData(name: userdataList[indexPath.row].name, imageName: userdataList[indexPath.row].imageName, contents: userdataList[indexPath.row].contents)
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerview = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        
        return headerview
    }
    
    // 헤더 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 420)
    }

    // Cell 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
            {
                return CGSize(width: 150, height: 250)
            
            }
    
    //Cell간의 위아래 간격지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
        {
                return 0
        }
    
    //Cell간의 좌우간격 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
        {
                return 27
        }
    
    // 마진
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
        {
                return UIEdgeInsets(top: 40, left: (view.frame.width - 300)/3, bottom: 0, right: (view.frame.width - 300)/3)
        }
}
