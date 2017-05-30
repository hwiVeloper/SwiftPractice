//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by Jonghwi Lee on 2017. 5. 30..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController : UIViewController {
    
    @IBOutlet var wv: UIWebView!
    
    // 목록에서 넘어온 영화 정보 변수
    var mvo : MovieVO!
    
    override func viewDidLoad() {
        NSLog("linkUrl = \(self.mvo?.detail), title=\(self.mvo?.title)")
        
        // navigation bar 제목에 값을 세팅
        let navbar = self.navigationItem
        navbar.title = self.mvo?.title
        
        // 요청할 url 값을 가져옴 (객체 생성)
        
        if let url = self.mvo?.detail {
            if let urlObj = URL(string: url) {
                let req = URLRequest(url: urlObj)
                // 웹 뷰에 요청된 url을 불러온다.
                self.wv.loadRequest(req)
            } else { // url 형식이 잘못되었을 경우
                let alert = UIAlertController(title: "오류", message: "잘못된 URL입니다.", preferredStyle: .alert)
                let cancel = UIAlertAction(title: "확인", style: .cancel) {
                    (_) in
                    // 이전페이지로 돌려보낸다.
                    _ = self.navigationController?.popViewController(animated: true)
                }
                
                alert.addAction(cancel)
                self.present(alert, animated: false, completion: nil)
            }
        } else { // url이 전달되지 않았을 때
            // 경고창으로 알림 전달 후 영화목록으로 돌아간다.
            let alert = UIAlertController(title: "오류", message: "필수 파라미터가 누락되었습니다.", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .cancel) {
                (_) in
                // 이전페이지로 돌려보낸다.
                _ = self.navigationController?.popViewController(animated: true)
            }
            
            alert.addAction(cancel)
            self.present(alert, animated: false, completion: nil)
        }
    }
}
