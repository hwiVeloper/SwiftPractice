//
//  ViewController.swift
//  Chapter03-NavigationBar
//
//  Created by Jonghwi Lee on 2018. 2. 7..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 네비게이션 타이틀 초기화
        //self.initTitle()
        //self.initTitleNew()
        //self.initTitleImage()
        self.initTitleInput()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initTitle() {
        // 1. 네비게이션 타이틀용 레이블 객체
        let nTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        
        // 2. 속성 설정
        nTitle.numberOfLines = 2 // 두 줄 표시
        nTitle.textAlignment = .center // 정렬 -> 중앙정렬
        nTitle.textColor = UIColor.white // 추가된 구문) 텍스트 색상 설정
        nTitle.font = UIFont.systemFont(ofSize: 15) // 폰트 크기
        nTitle.text = "58개 숙소 \n 1박(1월 10일 ~ 1월 11일)"
        
        // 3. 네비게이션 타이틀에 입력
        self.navigationItem.titleView = nTitle
        
        // 추가된 구문) 배경 색상 설정
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
    func initTitleNew() {
        // 1. 복합적인 레이아웃을 구현할 컨테이너 뷰
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 36))
        
        // 2. 상단 레이블 정의
        let topTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 18))
        topTitle.numberOfLines = 1
        topTitle.textAlignment = .center
        topTitle.font = UIFont.systemFont(ofSize: 15)
        topTitle.textColor = UIColor.white
        topTitle.text = "58개 숙소"
        
        // 3. 하단 레이블 정의
        let subTitle = UILabel(frame: CGRect(x: 0, y: 18, width: 200, height: 18))
        subTitle.numberOfLines = 1
        subTitle.textAlignment = .center
        subTitle.font = UIFont.systemFont(ofSize: 12)
        subTitle.textColor = UIColor.white
        subTitle.text = "1박(1월 10일 ~ 1월 11일)"
        
        // 4. 상하단 레이블을 컨테이너 뷰에 추가한다.
        containerView.addSubview(topTitle)
        containerView.addSubview(subTitle)
        
        // 5. 내비게이션 타이틀에 컨테이터 뷰를 대입
        self.navigationItem.titleView = containerView
        // background color
        let color = UIColor(red: 0.02, green: 0.22, blue: 0.49, alpha: 1.0)
        self.navigationController?.navigationBar.barTintColor = color
    }
    
    func initTitleImage() {
        let image = UIImage(named: "swift_logo")
        let imageV = UIImageView(image: image)
        
        self.navigationItem.titleView = imageV
    }
    
    func initTitleInput() {
        // 텍스트 필드 객체 생성
        let tf = UITextField()
        tf.frame = CGRect(x: 0, y: 0, width: 300, height: 35)
        tf.backgroundColor = UIColor.white // 배경 색상 흰색
        tf.font = UIFont.systemFont(ofSize: 13) // 글씨포인트
        tf.autocapitalizationType = .none // 자동 대문자 변환 속성 사용 안하도록
        tf.autocorrectionType = .no // 자동 입력 기능 해제
        tf.spellCheckingType = .no // 스펠링 체크 기능 해제
        tf.keyboardType = .URL // URL 입력 전용 키보드
        tf.keyboardAppearance = .dark // 키보드 스타일
        tf.layer.borderWidth = 0.3 // 테두리 경계선 두께
        tf.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        // 타이블 뷰 속성에 대입
        self.navigationItem.titleView = tf
        
        // 커스텀뷰 추가
        // let v = UIView()
        // v.frame = CGRect(x: 0, y: 0, width: 150, height: 37)
        // v.backgroundColor = UIColor.brown
        
        // 우측 바 아이템 영역
        // let rv = UIView()
        // rv.frame = CGRect(x: 0, y: 0, width: 100, height: 37)
        // rv.backgroundColor = UIColor.red
        
        // let rightItem = UIBarButtonItem(customView: rv)
        // self.navigationItem.rightBarButtonItem = rightItem
        
        // 크롬 브라우저 앱 흉내내기
        // 왼쪽 아이템 영역에 들어갈 뷰
        let back = UIImage(named: "arrow-back")
        let leftItem = UIBarButtonItem(image: back, style: .plain, target: self, action: nil)
        
        // 왼쪽 아이템 영역에 이미지 뷰 설정
        self.navigationItem.leftBarButtonItem = leftItem
        
        // 크롬 브라우저 흉내 : 우측 아이템 영역
        // 1. 오른쪽 아이템 영역에 들어갈 컨테이너 뷰
        let rv = UIView()
        rv.frame = CGRect(x: 0, y: 0, width: 70, height: 37)
        
        let rItem = UIBarButtonItem(customView: rv)
        self.navigationItem.rightBarButtonItem = rItem
        
        // 2. 카운트 값을 표시할 레이블 구성
        let cnt = UILabel()
        cnt.frame = CGRect(x: 10, y: 8, width: 20, height: 20)
        cnt.font = UIFont.boldSystemFont(ofSize: 10)
        cnt.textColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0)
        cnt.text = "12"
        cnt.textAlignment = .center
        
        // 외곽선
        cnt.layer.cornerRadius = 3 // 모서리 둥글게 처리
        cnt.layer.borderWidth = 2
        cnt.layer.borderColor = UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor
        
        // 레이블을 서브 뷰로 추가
        rv.addSubview(cnt)
        
        // 3. more 버튼 구현
        let more = UIButton(type: .system)
        more.frame = CGRect(x: 50, y: 10, width: 16, height: 16)
        more.setImage(UIImage(named: "more"), for: .normal)
        
        rv.addSubview(more)
    }
}

