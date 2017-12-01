//
//  ViewController.swift
//  HelloWorld
//
//  Created by Jonghwi Lee on 2017. 4. 10..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 레이블을 끌고 오면 UILabel타입의 변수가 추가된다.
    // 아울렛 변수 - 인터페이스 빌더 요소를 참조 가능하도록 연결된 멤버 변수
    @IBOutlet weak var uiTitle: UILabel! // 어노테이션
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 같은 방법으로 추가하지만, 메소드가 추가된다 (Action)
    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text = "Hello, World!"
    }

}
