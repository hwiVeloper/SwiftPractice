//
//  FrontViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by Jonghwi Lee on 2018. 7. 1..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class FrontViewController : UIViewController {
    // 사이드바 오픈 기능을 위임할 델리게이트
    var delegate: RevealViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 사이드바 오픈용 버튼 정의
        let btnSideBar = UIBarButtonItem(image: UIImage(named: "sidemenu.png"),
                                         style: UIBarButtonItemStyle.plain,
                                         target: self,
                                         action: #selector(moveSide) )
        
        // 버튼을 네비게이션 바의 왼쪽 영역에 추가
        self.navigationItem.leftBarButtonItem = btnSideBar
        
        // 화면 끝에서 다른 쪽으로 패닝하는 제스처를 정의
        let dragLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(moveSide))
        dragLeft.edges = UIRectEdge.left // 시작은 왼쪽
        self.view.addGestureRecognizer(dragLeft) // 뷰에 제스쳐 객체를 등록
        
        // 화면을 스와이프하는 제스처를 정의(사이드 메뉴 닫기용)
        let dragRight = UISwipeGestureRecognizer(target: self, action: #selector(moveSide))
        dragRight.direction = .left // 방향은 왼쪽
        self.view.addGestureRecognizer(dragRight) // 뷰에 제스처 객체를 등록
    }
    
    // 사용자의 액션에 따라 델리게이트 메소드를 호출한다.
    @objc func moveSide(_ sender: Any) {
        if sender is UIScreenEdgePanGestureRecognizer {
            self.delegate?.openSideBar(nil)
        } else if sender is UISwipeGestureRecognizer {
            self.delegate?.closeSideBar(nil)
        } else if sender is UIBarButtonItem {
            if self.delegate?.isSiderBarShowing == false {
                self.delegate?.openSideBar(nil) // 사이드 바를 연다.
            } else {
                self.delegate?.closeSideBar(nil) // 사이드 바를 닫는다.
            }
        }
        
        // RevealViewController에 델리게이트 참조 정보를 기입
    }
}
