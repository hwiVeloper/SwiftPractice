//
//  MapKitViewController.swift
//  Chapter03-Alert
//
//  Created by Jonghwi Lee on 2018. 2. 18..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapKitViewController : UIViewController {
    override func viewDidLoad() {
        // 뷰 컨트롤러에 맵킷 뷰를 추가
        let mapkitView = MKMapView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        self.view = mapkitView
        self.preferredContentSize.height = 200
        
        // <<<< 다시 한 번 추가 구문 시작
        // 1. 위치 정보 설정. 위/경도 사용
        let pos = CLLocationCoordinate2D(latitude: 37.514322, longitude: 126.894623)
        
        // 2. 지도에서 보여줄 넓이. 일종의 축척. 숫자가 작을수록 좁은 범위를 확대시켜서 보여줌
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        
        // 3. 지도 영역을 정의
        let region = MKCoordinateRegion(center: pos, span: span) // 1, 2에서 설정한 값 사용
        
        // 4. 지도 뷰에 표시
        mapkitView.region = region
        mapkitView.regionThatFits(region)
        
        // 5. 위치를 핀으로 표시
        let point = MKPointAnnotation()
        point.coordinate = pos
        mapkitView.addAnnotation(point)
        // <<<< 다시 한 번 추가 구문 끝
    }
}
