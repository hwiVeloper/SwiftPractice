//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by Jonghwi Lee on 2017. 5. 25..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /**
          * 입력값 속성 설정
          */
        self.tf.placeholder = "값을 입력하세요." // 안내 메시지
        self.tf.keyboardType = UIKeyboardType.alphabet // 키보드 타입
        self.tf.keyboardAppearance = UIKeyboardAppearance.dark // 키보드 스타일
        self.tf.returnKeyType = UIReturnKeyType.join // 리턴키 타입
        self.tf.enablesReturnKeyAutomatically = true // 리턴키 자동 활성화
        
        /**
          * 스타일 설정
          */
        self.tf.borderStyle = UITextBorderStyle.line // 테두리 스타일
        self.tf.backgroundColor = UIColor(white: 0.87, alpha: 1.0) // 배경 색상
        self.tf.contentVerticalAlignment = .center // 수직 방향 텍스트 배열 위치
        self.tf.contentHorizontalAlignment = .center // 수평 방향 텍스트 배열 위치
        self.tf.layer.borderColor = UIColor.darkGray.cgColor // 테두리 색상
        self.tf.layer.borderWidth = 2.0 // 테두리 두께
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var tf: UITextField!

}

