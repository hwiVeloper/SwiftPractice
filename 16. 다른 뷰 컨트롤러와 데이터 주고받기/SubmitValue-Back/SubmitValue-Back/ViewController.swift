//
//  ViewController.swift
//  SubmitValue-Back
//
//  Created by Jonghwi Lee on 2017. 5. 24..
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

    // 값을 화면에 표시할 아울렛 변수
    @IBOutlet var resultEmail: UILabel!
    @IBOutlet var resultUpdate: UILabel!
    @IBOutlet var resultInterval: UILabel!
    
    /* AppDelegate를 사용한다. */
    // 값을 전달받아 올 프로퍼티
//    var paramEmail : String?
//    var paramUpdate : Bool?
//    var paramInterval : Double?
    
    
    
    // 화면이 표시될 때마다 호출되는 메서드 (viewWillAppear)
    override func viewWillAppear(_ animated: Bool) {
//        if let email = paramEmail {
//            resultEmail.text = email
//        }
//        
//        if let update = paramUpdate {
//            resultUpdate.text = update == true ? "자동 갱신" : "수동 갱신"
//        }
//        
//        if let interval = paramInterval {
//            resultInterval.text = "\(Int(interval))분 마다"
//        }
        
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let email = ad?.paramEmail {
            resultEmail.text = email
        }
        
        if let update = ad?.paramUpdate {
            resultUpdate.text = update == true ? "자동 갱신" : "수동 갱신"
        }
        
        if let interval = ad?.paramInterval {
            resultInterval.text = "\(Int(interval))분 마다"
        }
    }
    
    @IBAction func performSegue(_ sender: Any) {
        guard let fvc = self.storyboard?.instantiateViewController(withIdentifier: "FormVC") as? FormViewController else {
            return
        }
        self.present(fvc, animated: true)
    }
    
    // UserDefaults 객체를 이용해도 된다.
    // 반영구적인 것이며, 앱이 삭제될 때까지 값이 유지가 된다.
    // 사용법은 AppDelegate와 유사하다.
    // 단, 인스턴스를 가져오지 않고 바로 사용이 가능하다 (UserDefaults.standard)
}

