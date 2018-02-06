//
//  ViewController.swift
//  Chapter02-InputForm
//
//  Created by Jonghwi Lee on 2018. 1. 31..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var paramEmail: UITextField! // 뷰 컨트롤러 내에서 제한 없이 접근하기 위해 클레스 레벨의 프로퍼티로 설정.
    var paramUpdate: UISwitch!
    var paramInterval: UIStepper!
    
    var txtUpdate: UILabel!
    var txtInterval: UILabel!

    override func viewDidLoad() {
        // 1. 네비게이션 바 타이틀 입력.
        self.navigationItem.title = "설정"
        
        // 2. 이메일 레이블 생성. 영역, 문구 설정
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
        
        // 3. 레이블 폰트 설정
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        
        // 4. 레이블을 루트 뷰에 추가
        self.view.addSubview(lblEmail)
        
        // 자동갱신 레이블 생성 및 추가
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpdate.text = "자동갱신"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblUpdate)
        
        // 갱신주기 레이블 생성 및 추가
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(lblInterval)
        
        // 이메일 입력을 위한 텍스트 필드를 추가.
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.borderStyle = UITextBorderStyle.roundedRect
        self.paramEmail.autocapitalizationType = .none // 대문자 자동 변환 기능 해제
        
        self.view.addSubview(self.paramEmail)
        
        // 스위치 객체 생성
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        self.paramUpdate.setOn(true, animated: true) // 기본값 , 애니메이트 설정
        self.view.addSubview(self.paramUpdate)
        
        // 갱신주기 -> 스태퍼 생성
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0 // 최소값
        self.paramInterval.maximumValue = 100 // 최대값
        self.paramInterval.stepValue = 1 // 증감단위
        self.paramInterval.value = 0 // 초기값
        
        self.view.addSubview(self.paramInterval)
        
        // 스위치 컨트롤값을 표시해 줄 레이블 추가
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        self.txtUpdate.font = UIFont.systemFont(ofSize: 12)
        self.txtUpdate.textColor = UIColor.red
        self.txtUpdate.text = "갱신함" // 갱신함 or 갱신하지 않음
        self.view.addSubview(self.txtUpdate)
        
        // 스테퍼 값을 텍스트로 표현할 레이블 추가
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "0분마다"
        self.view.addSubview(self.txtInterval)
        
        // 메소드 추가 후 ValueChanged 이벤트를 각각 액션 메소드에 연결.
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .valueChanged)
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .valueChanged)
        
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose,
                                        target: self,
                                        action: #selector(submit(_:)))
        self.navigationItem.rightBarButtonItem = submitBtn
        
        // 폰트 파일의 Post Script Name
        for family in UIFont.familyNames {
            print("\(family)")
            
            for names in UIFont.fontNames(forFamilyName: family) {
                print("== \(names)")
            }
        }
    }
    
    // 스위치와 상호반응할 액션 메소드
    @objc func presentUpdateValue(_ sender: UISwitch) {
        self.txtUpdate.text = (sender.isOn == true ? "갱신함" : "갱신하지 않음")
    }
    
    // 스테퍼와 상호반응할 액션 메소드
    @objc func presentIntervalValue(_ sender: UIStepper) {
        // 원래가 실수형이므로 Int로 바꿈
        self.txtInterval.text = ("\(Int(sender.value))분마다")
    }
    
    // 전송 버튼과 상호반응할 액션 메소드
    @objc func submit(_ sender: Any) {
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
}

