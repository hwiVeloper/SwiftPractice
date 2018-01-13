//
//  ViewController.swift
//  Chapter02-Button
//
//  Created by Jonghwi Lee on 2018. 1. 14..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼 인스턴스 생성 후 속성 설정
        let btn = UIButton(type: UIButtonType.system) // 버튼 인스턴스 생성
        btn.frame = CGRect(x: 50, y: 100, width: 150, height: 30)
        btn.setTitle("테스트 버튼", for: UIControlState.normal) // 직접 titleLabel 설정 시 에러. 상황따라 다르게 보여줘야 함
        
        // 치우친 버튼을 수평 중앙 정렬한다.
        btn.center = CGPoint(x: self.view.frame.size.width / 2, y: 100)
        
        // 루트 뷰에 버튼을 추가한다.
        self.view.addSubview(btn)
        
        // 버튼 이벤트와 btnOnClick 메서드를 연결한다.
        btn.addTarget(self, action: #selector(btnOnClick(_ :)), for: .touchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func btnOnClick(_ sender: Any) {
        // 호출한 객체가 버튼이라면 타이틀을 set
        if let btn = sender as? UIButton {
            btn.setTitle("클릭되었습니다.", for: UIControlState.normal)
        }
    }
}

