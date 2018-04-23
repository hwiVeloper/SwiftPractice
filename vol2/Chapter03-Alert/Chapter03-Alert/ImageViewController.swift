//
//  ImageViewController.swift
//  Chapter03-Alert
//
//  Created by Jonghwi Lee on 2018. 2. 18..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController : UIViewController {
    override func viewDidLoad() {
        // 1. 이미지와 이미지 뷰 객체 생성
        let icon = UIImage(named: "rating5")
        let iconV = UIImageView(image: icon)
        
        // 2. 이미지 뷰의 영역과 위치 지정
        iconV.frame = CGRect(x: 0, y: 0, width: (icon?.size.width)!, height: (icon?.size.height)!)
        
        // 3. 루트 뷰에 이미지 뷰를 추가
        self.view.addSubview(iconV)
        
        // 4. 외부에서 참조할 뷰 컨트롤러 사이즈를 이미지 크기와 동일하게 지정
        self.preferredContentSize = CGSize(width: (icon?.size.width)!, height: (icon?.size.height)! + 10) // 이미지 아래 여백 +10
    }
}
