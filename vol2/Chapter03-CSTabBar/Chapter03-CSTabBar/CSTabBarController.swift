//
//  CSTabBarController.swift
//  Chapter03-CSTabBar
//
//  Created by Jonghwi Lee on 2018. 5. 26..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class CSTabBarController : UITabBarController {
    let csView = UIView()
    let tabItem01 = UIButton(type: .system)
    let tabItem02 = UIButton(type: .system)
    let tabItem03 = UIButton(type: .system)
    
    override func viewDidLoad() {
        // 기존 탭 바를 숨김 처리
        self.tabBar.isHidden = true
        
        // 새로운 탭 바 역할을 할 뷰를 위해 기준 좌표와 크기 정의
        let width = self.view.frame.width // 뷰의 너비가 화면 전체 너비와 동일하도록
        let height: CGFloat = 50 // 뷰의 높이를 50으로 설정
        let x: CGFloat = 0 // 뷰가 탭 바처럼 화면의 왼쪽에 빈 공간 없이 채워지도록 x좌표 0으로
        let y = self.view.frame.height - height // 뷰가 화면 하단까지 빈 공간 없이 채워지도록
        
        // 정의된 값을 이용하여 새로운 뷰의 속성을 설정.
        self.csView.frame = CGRect(x: x, y: y, width: width, height: height)
        self.csView.backgroundColor = UIColor.brown
        
        self.view.addSubview(self.csView)
        
        // 1. 버튼 너비와 높이 설정
        let tabBtnWidth = self.csView.frame.size.width / 3
        let tabBtnHeight = self.csView.frame.height
        
        // 2. 버튼 영역 설정
        self.tabItem01.frame = CGRect(x: 0, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem02.frame = CGRect(x: tabBtnWidth, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        self.tabItem03.frame = CGRect(x: tabBtnWidth * 2, y: 0, width: tabBtnWidth, height: tabBtnHeight)
        
        // 3. 버튼의 공통 속성을 설정하고, 뷰에 추가
        self.addTabBarBtn(btn: self.tabItem01, title: "첫 번째 버튼", tag: 0)
        self.addTabBarBtn(btn: self.tabItem02, title: "두 번째 버튼", tag: 1)
        self.addTabBarBtn(btn: self.tabItem03, title: "세 번째 버튼", tag: 2)
        
        // 첫 번째 탭이 처음에 선택되도록 초기화
        self.onTabBarItemClick(self.tabItem01)
    }
    
    // 버튼 공통 속성을 정의하기 위한 메소드
    func addTabBarBtn(btn: UIButton, title: String, tag: Int) {
        // 버튼 타이틀, 태그값 입력
        btn.setTitle(title, for: .normal)
        btn.tag = tag
        
        // 4. 버튼의 텍스트 색상을 일반 상태와 선택된 상태로 나누어 설정
        btn.setTitleColor(UIColor.white, for: .normal) // 일반 상태의 버튼 색상
        btn.setTitleColor(UIColor.yellow, for: .selected) // 선택되었을 때 버튼 색상
        
        // 5. 버튼에 액션 메소드 연결
        btn.addTarget(self, action: #selector(onTabBarItemClick(_:)), for: .touchUpInside)
        
        // csView에 버튼 추가
        self.csView.addSubview(btn)
    }
    
    @objc func onTabBarItemClick(_ sender: UIButton) {
        // 모든 버튼 선택되지 않은 상태로 초기화
        self.tabItem01.isSelected = false
        self.tabItem02.isSelected = false
        self.tabItem03.isSelected = false
        
        // 인자로 입력된 버튼만 선택된 상태로 변경 처리
        sender.isSelected = true
        
        // 버튼에 설정된 태그값을 활용하여 해당 뷰 컨트롤러로 전환한다.
        self.selectedIndex = sender.tag
    }
}
