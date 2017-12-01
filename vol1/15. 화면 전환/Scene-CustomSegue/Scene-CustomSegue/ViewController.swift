//
//  ViewController.swift
//  Scene-CustomSegue
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("세그웨이가 실행되기 전 전처리 메서드! 세그웨이가 실행된다.") // Log
        NSLog("segueway identifier : \(segue.identifier)") // Segueway identifier에 따라 다르게 출력된다.
        
        if(segue.identifier == "custom_segue") {
            NSLog("custom_segue가 실행된다.")
        } else if(segue.identifier == "action_segue") {
            NSLog("action_segue가 실행된다.")
        } else {
            NSLog("알 수 없는 segue")
        }
    }
}

