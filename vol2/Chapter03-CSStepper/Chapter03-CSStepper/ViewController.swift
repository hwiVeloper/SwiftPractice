//
//  ViewController.swift
//  Chapter03-CSStepper
//
//  Created by Jonghwi Lee on 2018. 5. 27..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        let stepper = CSStepper()
        stepper.frame = CGRect(x: 30, y: 100, width: 130, height: 30)
        
        // ValueChange 이벤트 발생시 logging(_:) 메소드 호출.
        stepper.addTarget(self, action: #selector(logging(_:)), for: .valueChanged)
        
        self.view.addSubview(stepper)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func logging(_ sender: CSStepper) {
        NSLog("현재 Stepper의 값은 \(sender.value)입니다.")
    }
}

