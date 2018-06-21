//
//  CSStepper.swift
//  Chapter03-CSStepper
//
//  Created by Jonghwi Lee on 2018. 5. 27..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

// @IBDesignable : 해당 클래스를 스토리보드에서 로드했을 때 미리보기를 제공
// @IBInspectable : 정의한 속성을 인터페이스 빌더에서 설정할 수 있도록한다.

@IBDesignable
public class CSStepper: UIView {
    public var leftBtn = UIButton(type: .system) // 좌버튼
    public var rightBtn = UIButton(type: .system) // 우버튼
    public var centerLabel = UILabel() // 중앙 레이블
    // public : 외부 클래스에서 CSStepper 생성 후 접근 가능.
    @IBInspectable
    public var value: Int = 0 { // Stepper의 현재값 저장할 변수
        didSet { // 프로퍼티 값이 바뀌면 자동으로 호출
            self.centerLabel.text = String(value)
        }
    }
    
    // 좌우측 버튼 타이틀 속성
    @IBInspectable
    public var leftTitle: String = "⬇︎" {
        didSet {
            self.leftBtn.setTitle(leftTitle, for: .normal)
        }
    }
    @IBInspectable
    public var rightTitle: String = "⬆︎" {
        didSet {
            self.rightBtn.setTitle(rightTitle, for: .normal)
        }
    }
    
    // 센터 영역 색상
    @IBInspectable
    public var bgColor: UIColor = UIColor.cyan {
        didSet {
            self.centerLabel.backgroundColor = backgroundColor
        }
    }
    
    // 스토리보드에서 호출할 초기화 메소드
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }
    
    // 프로그래밍 방식으로 호출할 초기화 메소드
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    // 증감값 단위
    @IBInspectable public var stepValue: Int = 1
    // 증감값 최대 최소값
    @IBInspectable public var maxValue: Int = 100
    @IBInspectable public var minValue: Int = -100
    
    private func setup() {
        // Stepper 기본 속성 설정.
        
        // 공통 속성 설정
        let borderWidth: CGFloat = 0.5 // 테두리 두께값
        let borderColor = UIColor.blue.cgColor // 테두리 색상값
        
        // 좌측 다운버튼 속성 설정
        self.leftBtn.tag = -1 // 태그값에 -1을 부여 (추후 카운트 증감)
//        self.leftBtn.setTitle("⬇︎", for: .normal) // 버튼의 타이틀(텍스트)
        self.leftBtn.setTitle(self.leftTitle, for: .normal)
        self.leftBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 버튼 타이틀 폰트
        self.leftBtn.layer.borderWidth = borderWidth // 버튼 테두리 두께
        self.leftBtn.layer.borderColor = borderColor // 버튼 테두리 색상
        
        // 우측 업버튼 속성 설정
        self.rightBtn.tag = 1 // 태그값에 1을 부여 (추후 카운트 증감)
//        self.rightBtn.setTitle("⬆︎", for: .normal) // 버튼의 타이틀(텍스트)
        self.rightBtn.setTitle(self.rightTitle, for: .normal)
        self.rightBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20) // 버튼 타이틀 폰트
        self.rightBtn.layer.borderWidth = borderWidth // 버튼 테두리 두께
        self.rightBtn.layer.borderColor = borderColor // 버튼 테두리 색상
        
        // 중앙 레이블 속성 설정
        self.centerLabel.text = String(value) // 컨트롤의 현재값을 문자열로 변환하여 표시
        self.centerLabel.font = UIFont.systemFont(ofSize: 16) // 레이블의 폰트
        self.centerLabel.textAlignment = .center // 가운데 정렬
//        self.centerLabel.backgroundColor = UIColor.cyan // 배경 색상 지정
        self.centerLabel.backgroundColor = self.bgColor
        self.centerLabel.layer.borderWidth = borderWidth // 레이블 테두리 두께
        self.centerLabel.layer.borderColor = borderColor // 레이블 테두리 색상
        
        // 영역별 객체를 서브 뷰로 추가한다.
        self.addSubview(self.leftBtn)
        self.addSubview(self.centerLabel)
        self.addSubview(self.rightBtn)
        
        // 버튼의 터치 이벤트와 valueChange(_:) 메소드를 연결.
        self.leftBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.rightBtn.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        // 버튼 너비 = 뷰 높이
        let btnWidth = self.frame.height
        
        // 레이블 너비 = 뷰 전체 크기 - 양쪽 버튼의 너비 합
        let lblWidth = self.frame.width - (btnWidth * 2)
        
        self.leftBtn.frame = CGRect(x: 0, y: 0, width: btnWidth, height: btnWidth)
        
        self.centerLabel.frame = CGRect(x: btnWidth, y: 0, width: lblWidth, height: btnWidth)
        
        self.rightBtn.frame = CGRect(x: btnWidth + lblWidth, y: 0, width: btnWidth, height: btnWidth)
    }
    
    // value 속성 값 변경하는 메소드
    @objc public func valueChange(_ sender: UIButton) {
        // 값 변경 전, 최대 최소 범위를 초과하지 않는지 체크
        let sum = self.value + (sender.tag * self.stepValue)
        
        // 최대값보다 크거나 최소값보다 작으면 변경하지 않고 종료
        if sum > self.maxValue || sum < self.minValue {
            return
        }
        
        // value 값에 +1, -1
        self.value += (sender.tag * self.stepValue)
    }
}
