//
//  ResultViewController.swift
//  SubmitValue
//
//  Created by Jonghwi Lee on 2017. 5. 24..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import Foundation

import UIKit

class ResultViewController: UIViewController {
    // label
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    // 값을 받을 변수
    var paramEamil : String = ""
    var paramUpdate : Bool = false
    var paramInterval : Double = 0
    
    // 값을 받은 결과
    override func viewDidLoad() {
        self.resultEmail.text = paramEamil
        self.resultUpdate.text = paramUpdate ? "갱신함" : "갱신하지 않음"
        self.resultInterval.text = paramUpdate ? "\(Int(paramInterval))분 마다 갱신" : "갱신하지 않음"
    }
    @IBAction func onBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
