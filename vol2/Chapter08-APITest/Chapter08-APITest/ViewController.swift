//
//  ViewController.swift
//  Chapter08-APITest
//
//  Created by Jonghwi Lee on 2018. 8. 8..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var currentTime: UILabel!
    @IBOutlet var userId: UITextField!
    @IBOutlet var name: UITextField!
    @IBOutlet var responseView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func callCurrentTime(_ sender: Any) {
        do {
            // URL 설정 및 GET 방식으로 API 호출
            let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/currentTime")
            let response = try String(contentsOf: url!)
            
            // 읽어온 값을 레이블에 표시
            self.currentTime.text = response
            self.currentTime.sizeToFit()
        } catch let e as NSError {
            print(e.localizedDescription)
        }
    }
    
    @IBAction func post(_ sender: Any) {
        // 전송할 값 준비
        let userId = (self.userId.text)!
        let name = (self.name.text)!
        let param = "userId=\(userId)&name=\(name)"
        let paramData = param.data(using: .utf8)
        
        // URL 객체 정의
        let url = URL(string: "http://swiftapi.rubypaper.co.kr:2029/practice/echo")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = paramData
        
        // HTTP 메시지 헤더 설정
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Length")
        request.setValue(String(paramData!.count), forHTTPHeaderField: "Content-Length")
        
        // URLSession 객체를 통해 전송 및 응답값 처리 로직 작성
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // 응답이 없거나 통신이 실패
            if let e = error {
                NSLog("An error has been occurred : \(e.localizedDescription)")
                return
            }
            // 응답 처리 로직
            // 메인 스레드에서 비동기로 처리
            DispatchQueue.main.async() {
                do {
                    let object = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                    guard let jsonObject = object else { return }
                    
                    // JSON 겨로가값을 추출
                    let result    = jsonObject["result"] as? String
                    let timestamp = jsonObject["timestamp"] as? String
                    let userId    = jsonObject["userId"] as? String
                    let name      = jsonObject["name"] as? String
                    
                    // 결과가 성공일 때만 텍스트 뷰에 출력
                    if result == "SUCCESS" {
                        self.responseView.text = "아이디 : \(userId!) \n"
                        + "이름 : \(name!)\n"
                        + "응답결과 : \(result!)\n"
                        + "응답시간 : \(timestamp!)\n"
                        + "요청방식 : x-www-form-urlencoded"
                    }
                } catch let e as NSError {
                    print("An error has occurred while parsing JSONObject : \(e.localizedDescription)")
                }
            }
        }
        
        // POST 전송
        task.resume()
    }
}

