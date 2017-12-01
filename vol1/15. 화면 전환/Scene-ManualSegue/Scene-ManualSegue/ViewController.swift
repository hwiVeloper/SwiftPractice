//
//  ViewController.swift
//  Scene-ManualSegue
//
//  Created by Jonghwi Lee on 2017. 5. 23..
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
    @IBAction func wind(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualWind", sender: self)
    }
    
    // tip
    // unwind 는 존재하지 않는다.
    // 첫번째 화면이 사라지고 두번째 화면이 등장하는 개념이 아니라
    // 첫번째 화면의 인스턴스는 계속 남아있기 때문이다.
    // 세그웨이가 동작하면 목적지의 인스턴스를 생성하기 때문에
    // 두번째 화면에서 unwind 와 같은 동작을 취하면 첫번째 뷰 컨트롤러 인스턴스를
    // 또 한 번 생성하기 때문에, 앱 오류와 함께 충돌이 일어난다.
    
    // 따라서, dismiss, popViewController와 같은 화면 복귀용 메서드를 사용한다.
    
    // 또는, 뷰 컨트롤러 상단에 Exit 아이콘을 활용한다. (Scene-UnwindSegue에서 알아본다.)
}

