//
//  CSLogButton.swift
//  MyMemory
//
//  Created by Jonghwi Lee on 2018. 6. 27..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

public enum CSLogType: Int {
    case basic // 기본출력
    case title // 타이틀출력
    case tag   // 태그값출력
}
public class CSLogButton: UIButton {
    // 로그 출력 타입
    public var logType: CSLogType = .basic // 기본값 - 기본 출력
    
    // 스토리보드 방식 인스턴스 초기화 메소드
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //버튼에 스타일 적용
        self.setBackgroundImage(UIImage(named: "button-bg"), for: .normal)
        self.tintColor = UIColor.white
        
        // 버튼 클릭 이벤트에 logging(_:) 메소드를 연결
        self.addTarget(self, action: #selector(logging(_:)), for: .touchUpInside)
    }
    
    // 로그를 출력하는 액션 메소드
    @objc func logging(_ sender: UIButton) {
        switch self.logType {
            case .basic:
                NSLog("버튼이 클릭되었습니다.")
            case .title:
                let btnTitle = sender.titleLabel?.text ?? "타이틀이 없는"
                NSLog("\(btnTitle) 버튼이 클릭되었습니다.")
            case .tag:
                NSLog("\(sender.tag) 버튼이 클릭되었습니다.");
        }
    }
}
