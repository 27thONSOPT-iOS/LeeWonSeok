//
//  PickerViewTestVC.swift
//  study_TableView
//
//  Created by 이원석 on 2020/10/31.
//

import UIKit

struct Part {
    var imageName: String
    var partName: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
class PickerViewTestVC: UIViewController {

    @IBOutlet weak var partImageView: UIImageView!
    @IBOutlet weak var partNameLabel: UILabel!
    @IBOutlet weak var partPickerView: UIPickerView!
    
    var parts: [Part] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setPartData()
        partPickerView.dataSource = self
        partPickerView.delegate = self
        initLayout()
        // Do any additional setup after loading the view.
    }
    
    func setPartData() { parts.append(contentsOf: [
        Part(imageName: "plan", partName: "Plan"),
        Part(imageName: "design", partName: "Design"),
        Part(imageName: "server", partName: "Server"),
        Part(imageName: "ios", partName: "iOS"),
        Part(imageName: "android", partName: "Android"),
        Part(imageName: "web", partName: "Web")
    ]) }
    
}

extension PickerViewTestVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // PickerView의 각 행(row)의 title을 지정해주는 메소드
        return parts[row].partName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // PickerView에서 행(row)를 선택했을 때 수행할 동작을 지정해 주는 메소드 let selectPart = parts[row]
        
        let selectPart = parts[row]
        // 이미지 지정
        self.partImageView.image = selectPart.makeImage()
        // 라벨 지정
        self.partNameLabel.text = selectPart.partName
    }
    
    //추가적으로 초기 파트를 지정해주는 메소드도 추가할 수 있다.
    func initLayout() {
        let initPart = parts[0]
        
        partImageView.image = initPart.makeImage()
        partNameLabel.text = initPart.partName
    }
}

extension PickerViewTestVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // PickerView의 컴포넌트 숫자를 지정해 주는 메소드
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // PickerView의 각 컴포넌트에서 행의 개수를 지정해 주는 메소드
        // parts 데이터의 개수 만큼의 행이 필요
        return parts.count
    }
    
    
}
