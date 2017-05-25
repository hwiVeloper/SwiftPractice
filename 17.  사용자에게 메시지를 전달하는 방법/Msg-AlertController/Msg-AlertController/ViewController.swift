//
//  ViewController.swift
//  Msg-AlertController
//
//  Created by Jonghwi Lee on 2017. 5. 25..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var result: UILabel!

    @IBAction func alert(_ sender: Any) {
        // 알림 컨트롤러 등록
        let alert = UIAlertController(title: "선택", message: "항목을 선택해주세요.", preferredStyle: /*UIAlertController*/.alert)
        // preferredStyle: actionSheet -> 화면 밑에 토스트로 뜬다.
        
        // 버튼 생성
        // .cancel은 한 개의 알림 컨트롤러에서 한 번만 사용 가능하다.
        let cancel = UIAlertAction(title: "취소", style: .cancel) {
            (_) in
            self.result.text = "취소 버튼을 클릭했습니다."
        }
        let okay   = UIAlertAction(title: "확인", style: .default) {
            (_) in
            self.result.text = "확인 버튼을 클릭했습니다."
        }
        let exec   = UIAlertAction(title: "실행", style: .destructive) {
            (_) in
            self.result.text = "확실행 버튼을 클릭했습니다."
        }
        let stop   = UIAlertAction(title: "중지", style: .default) {
            (_) in
            self.result.text = "중지 버튼을 클릭했습니다."
        }
        
        // 컨트롤러에 버튼을 추가
        alert.addAction(cancel)
        alert.addAction(okay)
        alert.addAction(exec)
        alert.addAction(stop)
        
        // 알림 실행
        self.present(alert, animated: true)
    }
    
    @IBAction func login(_ sender: Any) {
        let title = "iTunes Store에 로그인"
        let message = "사용자의 AppleID zziller03@gmail.com의 암호를 입력하십시오"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok     = UIAlertAction(title: "확인", style: .default) {
            (_) in
            // 처리내용
            if let tf = alert.textFields?[0] { // 옵셔널 .first로 접근 가능
                print("입력된 값은 \(tf.text!)입니다.")
            } else {
                print("입력된 값이 없습니다.")
                
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // 텍스트필드 추가
        alert.addTextField(configurationHandler: { (tf) in
            // 텍스트필드의 속성 설정
            tf.placeholder = "암호"
            tf.isSecureTextEntry = true // 암호 처리
        })
        
        self.present(alert, animated: true)
    }
    @IBAction func auth(_ sender: Any) {
        let title = "로그인"
        
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok     = UIAlertAction(title: "확인", style: .default) {
            (_) in
            let id = alert.textFields?[0].text
            let pw = alert.textFields?[1].text
            
            if id == "zziller03" && pw == "Paper0817!" {
                self.result.text = "인증되었습니다."
            } else {
                self.result.text = "인증 실패"
            }
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "아이디"
        })
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "비밀번호"
            tf.isSecureTextEntry = true
        })
        
        self.present(alert, animated: false)
    }
}

