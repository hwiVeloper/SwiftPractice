//
//  ListViewController.swift
//  Table-CellHeight
//
//  Created by Jonghwi Lee on 2017. 5. 29..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import Foundation

import UIKit

class ListViewController : UITableViewController {
    // 테이블 뷰에 연결될 데이터를 저장하는 배열
    var list = [String]()
    
    @IBAction func add(_ sender: Any) {
        // 알림창 객체 인스턴스 생성
        let alert = UIAlertController(title: "목록 입력", message: "추가될 글을 작성해주세요.", preferredStyle: .alert)
        
        // 알림창에 입력할 폼을 추가
        alert.addTextField() {
            (tf) in
            tf.placeholder = "내용을 입력하세요."
        }
        
        // ok 버튼 객체 생성
        let ok = UIAlertAction(title: "OK", style: .default) {
            (_) in
            // 알림창 0번째 필드에 값이 있다면
            if let title = alert.textFields?[0].text {
                // 배열에 입력된 값을 추가하고 테이블 갱신
                self.list.append(title)
                self.tableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // 버튼 추가
        alert.addAction(ok)
        alert.addAction(cancel)
        
        // 알림창을 띄운다.
        self.present(alert, animated: false)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell이라는 id를 가진 셀을 읽어오고 없으면 UITableViewCell 인스턴스를 생성
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        // A ?? B : A가 nil이 아닐 경우 옵셔널을 해제하고, nil이라면 B를 대신 사용
        // A != nil ? A! : B
        
        // 셀의 기본 텍스트 레이블 행 수 제한을 없앤다.
        cell.textLabel?.numberOfLines = 0
        
        // 셀의 기본 텍스트 레이블에 배열 변수의 값을 할당
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.estimatedRowHeight = 50 // 대강의 디폴트를 지정
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }

    // =====> 셀프 리사이징을 위해 주석 처리
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        let row = self.list[indexPath.row]
//        
//        // 높이 조절. 기본 60 + 글자 30자 이상일 때마다 20씩 늘려준다.
//        let height = CGFloat(60 + (row.characters.count / 30) * 20)
//        
//        return height
//    }
    // <===== 셀프 리사이징을 위해 주석처리
}
