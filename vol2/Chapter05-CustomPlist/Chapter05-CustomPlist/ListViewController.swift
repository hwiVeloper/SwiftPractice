//
//  ListViewController.swift
//  Chapter05-CustomPlist
//
//  Created by Jonghwi Lee on 2018. 7. 10..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class ListViewController : UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet var account: UITextField!
    
    var accountlist = [
        "hwiveloper@gmail.com",
        "webmaster@web.com",
        "abc1@gmail.com",
        "abc2@gmail.com",
        "abc3@gmail.com"
    ]
    
    override func viewDidLoad() {
        let picker = UIPickerView()
        
        // 1. 피커 뷰의 델리게이트 객체 지정
        picker.delegate = self
        
        // 2. account 텍스트 필드 입력 방식을 가상 키보드 대신 피커 뷰로 설정
        self.account.inputView = picker
        
        // 툴 바 객체 정의
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: 0, height: 35)
        toolbar.barTintColor = UIColor.lightGray
        
        // 액세서리 뷰 영역에 툴 바를 표시
        self.account.inputAccessoryView = toolbar
        
        // 툴 바에 들어갈 닫기 버튼
        let done = UIBarButtonItem()
        done.title = "Done"
        done.target = self
        done.action = #selector(pickerDone)
        
        // 추가 1. 가변 폭 버튼 정의
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // 버튼을 툴 바에 추가
        toolbar.setItems([flexSpace, done], animated: true)
    }
    
    // 생성할 컴포넌트 개수를 정의.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // 지정된 컴포넌트가 가질 목록의 길이를 정의.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.accountlist.count
    }
    
    // 지정된 컴포넌트의 목록 각 행에 출력될 내용을 정의.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.accountlist[row]
    }
    
    // 지정된 컴포넌트의 목록 각 행을 사용자가 선택했을 때 실행할 액션을 정의.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 1. 선택된 계정값을 텍스트 필드에 입력
        let account = self.accountlist[row]
        self.account.text = account
        
        // 2. 입력 뷰를 닫음
        //self.view.endEditing(true) => Done 버튼 추가로 삭제
    }
    
    @objc func pickerDone(_ sender: Any) {
        self.view.endEditing(true)
    }
}
