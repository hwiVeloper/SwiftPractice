//
//  SecondViewController.swift
//  Scene-Trans02
//
//  Created by Jonghwi Lee on 2017. 5. 22..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import UIKit

class SecondViewController : UIViewController {
    // button 에 의해서 화면 전환이 이루어졌을 때만 동작한다.
    @IBAction func back(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    // navigate bar 에 의해서 동작했을 때만 동작한다.
    @IBAction func back2(_ sender: Any) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}
