//
//  SecondViewController.swift
//  Scene-Trans01
//
//  Created by Jonghwi Lee on 2017. 5. 22..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

// 뷰 컨트롤러에 연결할 새로운 커스텀 클래스.

import UIKit

class SecondViewController : UIViewController {
    @IBAction func dismiss(_ sender: AnyObject) {
        // 전 화면으로 복귀 -> dismiss 메서드를 사용한다.
        // 실제로 되돌아가는 것이 아니라 이전 화면을 '다시 표시'하는 개념이다.
        self.presentingViewController?.dismiss(animated: true)
    }
    
}
