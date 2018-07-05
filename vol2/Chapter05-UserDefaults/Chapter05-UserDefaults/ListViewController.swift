//
//  ListViewController.swift
//  Chapter05-UserDefaults
//
//  Created by Jonghwi Lee on 2018. 7. 4..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var married: UISwitch!
    
    override func viewDidLoad() {
        let plist = UserDefaults.standard
        
        self.name.text = plist.string(forKey: "name")
        self.gender.selectedSegmentIndex = plist.integer(forKey: "gender")
        self.married.isOn = plist.bool(forKey: "married")
    }
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
        let value = sender.selectedSegmentIndex // 0 = man, 1 = woman
        
        let plist = UserDefaults.standard // 기본 저장소 객체를 가져온다.
        plist.set(value, forKey: "gender") // "gender"라는 키로 값을 가져온다.
        plist.synchronize() // 동기화 처리
    }
    @IBAction func changeMarried(_ sender: UISwitch) {
        let value = sender.isOn // true = married, false = not married
        
        let plist = UserDefaults.standard // 기본 저장소 객체를 가져온다.
        plist.set(value, forKey: "married") // "married"라는 키로 값을 가져온다.
        plist.synchronize() // 동기화 처리
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 이름 row 를 클릭했을 경우
        if indexPath.row == 0 {
            // 입력 가능한 알림창을 띄운다.
            let alert = UIAlertController(title: nil, message: "이름을 입력하세요.", preferredStyle: .alert)
            // 입력 필드 추가
            alert.addTextField() {
                $0.text = self.name.text // name 레이블의 텍스트를 입력폼에 기본값으로 넣어준다.
            }
            // 버튼 및 액션 추가
            alert.addAction(UIAlertAction(title: "OK", style: .default) { (_) in
                // 사용자가 OK 버튼을 누르면 입력 필드에 입력된 값을 저장.
                let value = alert.textFields?[0].text
                
                let plist = UserDefaults.standard
                plist.set(value, forKey: "name")
                plist.synchronize()
                
                // 수정된 값을 이름 레이블에 적용.
                self.name.text = value
            })
            //알림창을 띄운다.
            self.present(alert, animated: false, completion: nil)
        }
    }
}
