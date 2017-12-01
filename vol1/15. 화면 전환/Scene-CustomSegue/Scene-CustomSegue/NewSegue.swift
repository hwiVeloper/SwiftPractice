//
//  NewSegue.wift.swift
//  Scene-CustomSegue
//
//  Created by Jonghwi Lee on 2017. 5. 23..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import Foundation

import UIKit

class NewSegue: UIStoryboardSegue {
    
    // perform() 메서드를 오버라이드한다.
    override func perform() {
        // 세그웨이의 출발지 (source)
        let srcUVC = self.source
        
        // 세그웨이의 목적지 (destination)
        let desUVC = self.destination
        
        // 화면전환 세그웨이 실행
        UIView.transition(
            from: srcUVC.view,
            to: desUVC.view,
            duration: 1, // 전환되는데 걸리는 시간
            options: .transitionCurlDown // 전환 옵션
            // completion: <화면 전환이 끝난 후 실행할 함수나 클로져 구문>
        )
    }
}
