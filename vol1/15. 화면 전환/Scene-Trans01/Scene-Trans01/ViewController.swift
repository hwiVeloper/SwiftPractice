//
//  ViewController.swift
//  Scene-Trans01
//
//  Created by Jonghwi Lee on 2017. 5. 21..
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
    @IBAction func moveNext(_ sender: AnyObject) {
        // 스토리보드가 여러 개일 경우 스토리보드 객체를 생성하여 사용한다.
//        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main) // Bundle : 꾸러미
//        let uvcMain = storyboard.instantiateViewController(withIdentifier: "SecondVC")
        
        // 이동할 뷰 컨트롤러 객체를 StoryboardID로 참조한다.
        let uvc = self.storyboard!.instantiateViewController(withIdentifier: "SecondVC")
        // storyboard에 옵셔널도 사용 가능하다.
        
        // 전환 시 애니메이션 타입(coverVertical)
        uvc.modalTransitionStyle = UIModalTransitionStyle.coverVertical
        
        // parameter로 뷰 컨트롤러 인스턴스를 넣고 프레젠트 메소드 호출
        self.present(uvc, animated: true)
    }
}
