//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by Jonghwi Lee on 2017. 5. 30..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class TheaterViewController : UIViewController {
    
    var param : NSDictionary!
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        self.navigationItem.title = self.param["상영관명"] as? String
        
        // 위도와 경도 값 추출하여 Double로 캐스팅
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        
        // 위도와 경도로 2D 위치 정보 객체 정의
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        // 지도에 표현될 거리 : 단위는 m
        let regionRadius: CLLocationDistance = 100
        
        // 거리를 반영한 지역 정보를 조합한 지도 데이터 생성
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location, regionRadius, regionRadius)
        
        // map 변수에 연결된 지도 객체에 지도 데이터 전송
        self.map.setRegion(coordinateRegion, animated: false)
        
        let point = MKPointAnnotation()
        point.coordinate = location
        
        self.map.addAnnotation(point)
    }
}
