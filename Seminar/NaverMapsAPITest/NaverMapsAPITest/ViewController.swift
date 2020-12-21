//
//  ViewController.swift
//  NaverMapsAPITest
//
//  Created by 이원석 on 2020/12/21.
//

import UIKit
import NMapsMap

class ViewController: UIViewController {
    @IBOutlet weak var mapView: NMFMapView!
    
    var camera : NMFCameraUpdate! // MapView를 통해 보여지는 화면을 제어
    let coord = NMGLatLng(lat: 37.48101907116926, lng: 126.89632142650325) // 카메라를 이동시킬 좌표값
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.touchDelegate = self
        setCamera()
        setMarker()
        // Do any additional setup after loading the view.
    }
    
    // 해당 위치로 카메라를 업데이트
    func setCamera() {
        camera = NMFCameraUpdate(scrollTo: coord)
        camera.animation = .linear
        mapView.moveCamera(camera)
    }
    
    // 해당 좌표에 표시
    func setMarker() {
        let marker = NMFMarker()
        marker.position = coord
        marker.iconImage = NMapsMap.NMF_MARKER_IMAGE_PINK
        marker.mapView = mapView
    }
}

extension ViewController: NMFMapViewTouchDelegate {
    // 지도 상에서 터치된 지점의 위/경도 값을 얻어 오는 함수
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        print("\(latlng)")
    }
    
    // 지도 상에서 터치된 지점에 대한 정보가 있을 경우 이를 받아오는 메소드
    func mapView(_ mapView: NMFMapView, didTap symbol: NMFSymbol) -> Bool {
        print(symbol)
        
        return true
    }

}

