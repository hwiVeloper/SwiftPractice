//
//  FormViewController.swift
//  SubmitValue-Back
//
//  Created by Jonghwi Lee on 2017. 5. 24..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import Foundation

import UIKit

class FormViewController : UIViewController {
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!
    
    @IBAction func onSubmit(_ sender: Any) {
        // AppDelegate 에 변수를 추가한 후에는 이 소스가 필요없게 된다.
//        let pvc = self.presentingViewController
//        guard let vc = pvc as? ViewController else {
//            return
//        }
//        
//        // 값 전달
//        vc.paramEmail = self.email.text
//        vc.paramUpdate = self.isUpdate.isOn
//        vc.paramInterval = self.interval.value
        
        // AppDelegate 인스턴스를 가져온다.
        let ad = UIApplication.shared.delegate as ? AppDelegate
        
        // 값을 저장한다.
        ad?.paramEmail = self.email.text
        ad?.paramUpdate = self.isUpdate.isOn
        ad?.paramInterval = self.interval.value
        
        // 화면 복귀
        self.presentingViewController?.dismiss(animated: true)
    }
}
