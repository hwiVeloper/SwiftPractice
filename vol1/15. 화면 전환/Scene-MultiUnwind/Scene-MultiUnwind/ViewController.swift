//
//  ViewController.swift
//  Scene-MultiUnwind
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

    @IBAction func goToPage1(_ sender: UIStoryboardSegue) {
        // 첫번째 화면으로 돌아오게끔 하는 메서드이다. (이정표 메서드)
        // Page 4에서 Home 버튼을 클릭하는 순간 Page 1이 불러와지고
        // Page 2, 3의 인스턴스는 모두 해제된다. (dealloc이라고 한다.)
    }
}

