//
//  ViewController.swift
//  Scene-Trans02
//
//  Created by Jonghwi Lee on 2017. 5. 22..
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

    @IBAction func moveByNavy(_ sender: AnyObject) {
        // 두번째 뷰 컨트롤러 인스턴스를 가져온다.
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            // 없을 경우
            return
        }
        
        // 화면 전화
        self.navigationController?.pushViewController(uvc, animated: true)
    }

    // 프레젠트 메소드를 이용하는 예제
    @IBAction func movePresent(_ sender: Any) {
        guard let uvc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") else {
            return
        }
        
        self.present(uvc, animated: true)
    }
}

