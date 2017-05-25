//
//  ViewController.swift
//  SubmitValue
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
    
    // input
    @IBOutlet var email: UITextField!
    @IBOutlet var isUpdate: UISwitch!
    @IBOutlet var interval: UIStepper!

    // label
    @IBOutlet var isUpdateText: UILabel!
    @IBOutlet var intervalText: UILabel!

    // action
    @IBAction func onSwitch(_ sender: Any) { // UISwitch
        // 옵셔널 캐스팅
        guard let obj = sender as? UISwitch else {
            return
        }
        
        if (obj.isOn == true) {
            self.isUpdateText.text = "갱신함"
        } else {
            self.isUpdateText.text = "갱신하지 않음"
        }
    }
    @IBAction func onStepper(_ sender: Any) { // UIStepper
        // 강제 캐스팅
        let obj = sender as! UIStepper
        
        let intervalValue = Int(obj.value)
        self.intervalText.text = "\(intervalValue)분 마다"
    }
    
    // 명확한 타입을 sender에 설정해 주는 것을 권장한다.
    
    // on submit
    @IBAction func onSubmit(_ sender: Any) {
        //RVC 인스턴스 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            // 인스턴스의 프로퍼티들을 참조하기 위해 타입 캐스팅을 해 준다.
            // nil이 발생할 가능성을 무시하는 강제 캐스팅
            return
        }
        
        // 값을 전달
        rvc.paramEamil = self.email.text! // 이메일
        rvc.paramUpdate = self.isUpdate.isOn // 자동 갱신 여부
        rvc.paramInterval = self.interval.value // 갱신 주기
        
        // 화면 이동
        self.present(rvc, animated: true)
    }
    
    // Navigation Controller를 활용하는 방법
    @IBAction func onSubmitNav(_ sender: Any) {
        //RVC 인스턴스 생성
        guard let rvc = self.storyboard?.instantiateViewController(withIdentifier: "RVC") as? ResultViewController else {
            // 인스턴스의 프로퍼티들을 참조하기 위해 타입 캐스팅을 해 준다.
            // nil이 발생할 가능성을 무시하는 강제 캐스팅
            return
        }
        
        // 값을 전달
        rvc.paramEamil = self.email.text! // 이메일
        rvc.paramUpdate = self.isUpdate.isOn // 자동 갱신 여부
        rvc.paramInterval = self.interval.value // 갱신 주기
        
        // 화면 이동
//        self.present(rvc, animated: true, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    
    // 세그웨이를 이용하여 값을 전달
    @IBAction func onPerformSegue(_ sender: Any) {
        self.performSegue(withIdentifier: "ManualSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 목적지 뷰 컨트롤러의 인스턴스를 읽어 온다.
        let dest = segue.destination
        
        guard let rvc = dest as? ResultViewController else {
            return
        }
        
        // 값 전달
        rvc.paramEamil = self.email.text! // 이메일
        rvc.paramUpdate = self.isUpdate.isOn // 갱신여부
        rvc.paramInterval = self.interval.value // 갱신주기
    }
}

