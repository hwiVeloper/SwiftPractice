//
//  ViewController.swift
//  Scene-UnwindSegue
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

    @IBAction func unwindToVC(_ segue: UIStoryboardSegue) {
        // 호출 시 매개변수 생략을 위해 익명 처리한다. ( _  언더바 )
    }
}

