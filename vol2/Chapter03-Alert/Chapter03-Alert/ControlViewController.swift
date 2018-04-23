//
//  ControlViewController.swift
//  Chapter03-Alert
//
//  Created by Jonghwi Lee on 2018. 2. 18..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class ControlViewController : UIViewController {
    
    // 슬라이더 객체 정의
    private let slider = UISlider()
    
    // 슬라이더 객체의 값을 읽어올 연산 프로퍼티
    var sliderValue: Float {
        return self.slider.value
    }
    
    override func viewDidLoad() {
        // 슬라이더 최소 / 최대 설정
        self.slider.maximumValue = 100
        self.slider.minimumValue = 0
        
        // 슬라이더 영역과 크기 정의, 루트 뷰에 추가
        self.slider.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        self.view.addSubview(self.slider)
        
        // 뷰 컨트롤러 콘텐츠 사이즈 설정
        self.preferredContentSize = CGSize(width: self.slider.frame.width, height: self.slider.frame.height + 10)
    }
}
