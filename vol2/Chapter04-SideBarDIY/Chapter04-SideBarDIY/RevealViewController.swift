//
//  RevealViewController.swift
//  Chapter04-SideBarDIY
//
//  Created by Jonghwi Lee on 2018. 7. 1..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class RevealViewController : UIViewController {
    
    var contentVC: UIViewController? // 콘텐츠를 담당할 뷰 컨트롤러
    var sideVC: UIViewController? // 사이드 바 메뉴를 ㄷ마당할 뷰 컨트롤러
    
    var isSiderBarShowing = false // 현재 사이드 바가 열려 있는지 여부
    
    let SLIDE_TIME = 0.3 // 사이드 바가 열리고 닫히는 데 걸리는 시간 (상수)
    let SIDEBAR_WIDTH: CGFloat = 260 // 사이드 바가 열릴 너비 (상수)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    // 초기 화면을 설정.
    func setupView() {
        // 1. _프론트 컨트롤러 객체를 읽어온다.
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_front") as? UINavigationController {
            // 2. 읽어온 컨트롤러를 클래스 전체에서 참조할 수 있도록 contentVC 속성에 저장
            contentVC = vc
            // 3. _프론트 컨트롤러 객체를 메인 컨트롤러의 자식으로 등록.
            self.addChildViewController(vc) // _프론트 컨트롤러를 메인 컨트롤러의 자식 뷰 컨트롤러로 등록
            self.view.addSubview(vc.view) // _프론트 컨트롤러의 뷰를 메인 컨트롤러의 서브 뷰로 등록
            // _프론트 컨트롤러에 부모 뷰 컨트롤러가 바뀌었음을 알려준다.
            vc.didMove(toParentViewController: self)
            
            // 4. + 프론트 컨트롤러의 델리게이트 변수에 참조 정보를 넣어준다.
            let frontVC = vc.viewControllers[0] as? FrontViewController
            frontVC?.delegate = self
        }
    }
    
    // 사이드 바의 뷰를 읽어온다.
    func getSideView() {
        if self.sideVC == nil {
            // 1. 사이드 바 컨트롤러 객체를 읽어온다.
            if let vc = self.storyboard?.instantiateViewController(withIdentifier: "sw_rear") {
                // 2. 다른 메소드에서 참조가 가능하도록 sideVC 속성에 저장
                self.sideVC = vc
                // 3. 읽어온 사이드 바 컨트롤러 객체를 컨테이너 뷰 컨트롤러에 연결
                self.addChildViewController(vc)
                self.view.addSubview(vc.view)
                // 4. _프론트 컨트롤러에 부모 뷰 컨트롤러가 바뀌었음을 알려준다.
                vc.didMove(toParentViewController: self)
                // 5. _프론트 컨트롤러의 뷰를 제일 위로 올려준다.
                self.view.bringSubview(toFront: (self.contentVC?.view)!)
            }
        }
    }
    
    // 콘텐츠 뷰에 그림자 효과를 준다.
    func setShadowEffect(shadow: Bool, offset: CGFloat) {
        let contentVCLayer: CALayer = (self.contentVC?.view.layer)!
        
        if (shadow == true) { // 그림자 효과 설정
            contentVCLayer.cornerRadius = 10 // 글미자 모서리 둥글기
            contentVCLayer.shadowOpacity = 0.8 // 그림자 투명도
            contentVCLayer.shadowColor = UIColor.black.cgColor// 그림자 색상
            contentVCLayer.shadowOffset = CGSize(width: offset, height: offset)// 그림자 크기
        } else {
            contentVCLayer.cornerRadius = 0.0;
            contentVCLayer.shadowOffset = CGSize(width: offset, height: offset)
        }
    }
    
    // 사이드 바를 연다.
    func openSideBar(_ complete: ( () -> Void)? ) {
        // 1. 앞에서 정의했던 메소드들을 실행
        self.getSideView() // 사이드 바 뷰를 읽어온다.
        self.setShadowEffect(shadow: true, offset: -2) // 그림자 효과를 준다.
        
        // 2. 애니메이션 옵션
        let options = UIViewAnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        // 3. 애니메이션 실행
        UIView.animate(
            withDuration: TimeInterval(self.SLIDE_TIME),
            delay: TimeInterval(0),
            options: options,
            animations: {
                self.contentVC?.view.frame = CGRect(x: self.SIDEBAR_WIDTH, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            },
            completion: {
                if $0 == true {
                    self.isSiderBarShowing = true // 열림 상태로 플래그를 변경한다.
                    complete?() // 매개변수
                }
            }
        )
    }
    
    // 사이드 바를 닫는다.
    func closeSideBar(_ complete: ( () -> Void)? ) {
        // 애니메이션 옵션을 정의한다.
        let options = UIViewAnimationOptions([.curveEaseInOut, .beginFromCurrentState])
        // 애니메이션 실행
        UIView.animate(
            withDuration: TimeInterval(self.SLIDE_TIME),
            delay: TimeInterval(0),
            options: options,
            animations: {
                // 1. 옆으로 밀려난 콘텐츠 뷰의 위치를 제자리로 위치한다.
                self.contentVC?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            },
            completion: {
                if $0 == true {
                    // 2. 사이드바 뷰를 제거.
                    self.sideVC?.view.removeFromSuperview()
                    self.sideVC = nil
                    // 3. 닫힘 상태로 플래그를 변경.
                    self.isSiderBarShowing = false
                    // 4. 그림자 효과를 제거.
                    self.setShadowEffect(shadow: false, offset: 0)
                    // 5. 인자값으로 입력받은 완료 함수를 실행
                    complete?()
                }
            }
        )
    }
}
