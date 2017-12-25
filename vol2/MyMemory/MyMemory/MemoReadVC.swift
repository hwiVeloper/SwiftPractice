//
//  MemoReadVC.swift
//  MyMemory
//
//  Created by Jonghwi Lee on 2017. 12. 1..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import UIKit

class MemoReadVC: UIViewController {
    // 콘텐츠 데이터를 저장하는 변수
    var param : MemoData?
    @IBOutlet var subject: UILabel!
    @IBOutlet var contents: UILabel!
    @IBOutlet var img: UIImageView!
    
    override func viewDidLoad() {
        // 1. 제목과 내용, 이미지를 출력
        self.subject.text = param?.title
        self.contents.text = param?.contents
        self.img.image = param?.image
        
        // 2. 날짜 포맷 변환
        let formatter = DateFormatter()
        formatter.dateFormat = "dd일 HH:mm에 작성됨"
        let dateString = formatter.string(from: (param?.regdate)!)
        
        // 3. 내비게이션 타이틀에 날짜를 표시
        self.navigationItem.title = dateString
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
