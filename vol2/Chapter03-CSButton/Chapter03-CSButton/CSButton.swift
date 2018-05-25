//
//  CSButton.swift
//  Chapter03-CSButton
//
//  Created by Jonghwi Lee on 2018. 4. 24..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import UIKit

// 버튼 타입을 결정하는 열거형(enum)
public enum CSButtonType {
    case rect
    case circle
}

class CSButton: UIButton {
    // 스토리보드 방식으로 객체 생성 시, 호출되는 초기화 메서드
    // init(coder:)로 규격화되어 있다.
    // CSButton을 스토리보드에서 사용 가능하게 만든다.
    // 필수 구현 메소드
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        // 스토리보드 방식으로 버튼을 정의했을 때 적용.
        self.backgroundColor = UIColor.green // 배경
        self.layer.borderWidth = 2 // 테두리두께
        self.layer.borderColor = UIColor.black.cgColor // 데투리색
        self.setTitle("버튼", for: .normal) // 기본 문구
        
        // 액션 메소드 지정
        self.addTarget(self, action: #selector(counting(_:)), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        // -----> 1단계 초기화
        super.init(frame: frame)
        
        // -----> 2단계 초기화
        self.backgroundColor = UIColor.gray // 배경
        self.layer.borderWidth = 2 // 테두리두께
        self.layer.borderColor = UIColor.black.cgColor // 데투리색
        self.setTitle("코드생성버튼", for: .normal) // 기본 문구
    }
    
    // 새로운 지정 초기화 메소드
    // CSButton 클래스에서 새롭게 정의된 형식
    // 부모 클래스에서 이와 동일한 형식의 초기화 메소드는 존재하지 않는다.
    // 따라서 부모 클래스에 정의된 지정 초기화 메소드 중 하나를 임의 선택하여 호출.
    // => super.init(frame:)
    init() {
        super.init(frame: CGRect.zero)
        // 후에 CGRect를 따로 세팅 필요.
        // 그렇지 않으면 화면에 미표시.
    }
    
    convenience init(type: CSButtonType) {
        self.init()
        
        switch type {
            case .rect :
                self.backgroundColor = UIColor.black
                self.layer.borderColor = UIColor.black.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 0
                self.setTitleColor(UIColor.white, for: .normal)
                self.setTitle("Rect Button", for: .normal)
            case .circle :
                self.backgroundColor = UIColor.red
                self.layer.borderColor = UIColor.blue.cgColor
                self.layer.borderWidth = 2
                self.layer.cornerRadius = 50
                self.setTitleColor(UIColor.white, for: .normal)
                self.setTitle("Circle Button", for: .normal)
        }
    }
    
    var style: CSButtonType = .rect {
        // 프로퍼티 옵저버 (cf. willSet)
        didSet {
            switch style {
                case .rect :
                    self.backgroundColor = UIColor.black
                    self.layer.borderColor = UIColor.black.cgColor
                    self.layer.borderWidth = 2
                    self.layer.cornerRadius = 0
                    self.setTitleColor(UIColor.white, for: .normal)
                    self.setTitle("Rect Button", for: .normal)
                case .circle :
                    self.backgroundColor = UIColor.red
                    self.layer.borderColor = UIColor.blue.cgColor
                    self.layer.borderWidth = 2
                    self.layer.cornerRadius = 50
                    self.setTitleColor(UIColor.white, for: .normal)
                    self.setTitle("Circle Button", for: .normal)
            }
        }
    }
    
    // 버튼이 클릭된 횟수를 카운트하여 타이틀에 표시해 주는 함수
    @objc func counting(_ sender: UIButton) {
        sender.tag = sender.tag + 1
        sender.setTitle("\(sender.tag) 번째 클릭", for: .normal)
    }
}
