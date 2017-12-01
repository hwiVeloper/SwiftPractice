//
//  ViewController.swift
//  Delegate-TextField
//
//  Created by Jonghwi Lee on 2017. 5. 25..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

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
        
        self.tf.becomeFirstResponder() // 앱이 실행되면 처음으로 focus
        
        // 델리게이트 지정
        // 뷰 컨트롤러가 텍스트필드의 델리게이트 객체로 지정되었다.
        self.tf.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var tf: UITextField!

    @IBAction func confirm(_ sender: Any) {
        // input focus 해제
        self.tf.resignFirstResponder()
    }
    @IBAction func input(_ sender: Any) {
        // 다시 input focus
        self.tf.becomeFirstResponder()
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        // 텍스트 편집이 시작될 때 실행된다.
        print("textFieldShouldBeginEditing이 실행되었다.")
        return true // false 라면 편집이 되지 않는다.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // 텍스트 필드의 편집이 시작된 후
        print("textFieldDidBeginEditing이 실행되었다.")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn")
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear")
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // 숫자 입력하지 못하게 해보자.
        if Int(string) == nil { // 입력된 값이 숫자가 아니라면 true
            // 하나 더, 최대 길이를 지정해 보자.
            if (textField.text?.characters.count)! + string.characters.count > 10 {
                return false
            } else {
                return true
            }
        } else { // 숫자라면 false
            return false
        }
        
        print("텍스트 필드 내용이 \(string)으로 변경")
        return true
    }
}

