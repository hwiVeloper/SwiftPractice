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
        let url = URL(string: (self.mvo.detail)!)
        let req = URLRequest(url: url!)
        
        // 웹 뷰에 요청된 url을 불러온다.
        self.wv.loadRequest(req)
    }
}
