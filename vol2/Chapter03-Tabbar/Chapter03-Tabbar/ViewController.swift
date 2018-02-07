//
//  ViewController.swift
//  Chapter03-Tabbar
//
//  Created by Jonghwi Lee on 2018. 2. 6..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let title = UILabel(frame: CGRect(x: 0, y: 100, width: 100, height: 30))
        // 2
        title.text = "첫 번째 탭"
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
        self.tabBarItem.image = UIImage(named: "calendar.png")
        self.tabBarItem.title = "Calendar"
        */
    }
    
    /*
    * 화면을 터치 시, 탭 바 숨김/숨김해제
    */
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = self.tabBarController?.tabBar
        //tabBar?.isHidden = (tabBar?.isHidden == true) ? false : true // 반짝
        
        UIView.animate(withDuration: TimeInterval(0.15)) {
            // alpha 값이 0이면 1로, 1이면 0으로 바꾸어 준다.
            // 호출될 때마다 점점 투명해졌다가 점점 진해질 것임
            tabBar?.alpha = ( tabBar?.alpha == 0 ? 1 : 0 )
        }
    }
}

