//
//  SecondViewController.swift
//  Chapter03-Tabbar
//
//  Created by Jonghwi Lee on 2018. 2. 6..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        // 2
        title.text = "두 번째 탭"
        title.textColor = UIColor.red // 텍스트 빨강
        title.textAlignment = .center // 레이블 중앙 정렬
        title.font = UIFont.boldSystemFont(ofSize: 14) // 폰트는 system font, 크기는 14pt
        // 3
        title.sizeToFit() // 콘텐츠의 내용에 맞게 레이블 크기 변경
        // 4
        title.center.x = self.view.frame.width / 2 // x축 기준 중앙에 오도록
        
        self.view.addSubview(title)
        
        /* AppDelegate로 이동
        // 탭 바 아이템에 커스텀 이미지 등록 & 이름 지정
        self.tabBarItem.image = UIImage(named: "file-tree.png")
        self.tabBarItem.title = "File"
        */
    }
}

