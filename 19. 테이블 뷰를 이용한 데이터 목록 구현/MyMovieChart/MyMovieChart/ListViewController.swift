//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by Jonghwi Lee on 2017. 5. 26..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class ListViewController : UITableViewController {
    // 테이블 뷰를 구성할 리스트 데이터
//    var list = [MovieVO]()
    
    var dataset = [
        ("해리포터7", "해리포터 마지막편", "2015-01-01", 9.77, "darknight.jpg"),
        ("반지의 제왕: 왕의 귀환", "반지의 제왕 마지막편", "2013-05-28", 9.88, "rain.jpg"),
        ("너의 이름은", "키미노 나마에와", "2016-12-25", 8.66, "secret.jpg")
    ]
    
    lazy var list : [MovieVO] = {
        var datalist = [MovieVO]()
        
        for (title, description, opendate, rating, thumbnail) in self.dataset {
            let mvo = MovieVO()
            
            mvo.title = title
            mvo.description = description
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            
            datalist.append(mvo)
        }
        
        return datalist
    } ()
    
    override func viewDidLoad() {
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        NSLog("\(self.list.count)")
        return self.list.count // 생성해야 할 행의 개수
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 개별 행을 만드는 역할을 한다. 위에 메서드에서 반환된 값만큼 반복수행된다.
        // 주어진 행에 맞는 데이터 소스를 read
        let row = self.list[indexPath.row]
        
        // ===== MovieCell을 이용한 케이스 시작
        // 테이블 셀 객체를 직접 생성하지 않고 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        cell.thumbnail?.image = UIImage(named: row.thumbnail!)
        // ===== MovieCell을 이용한 케이스 끝
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 행이 선택되었을 때 로그를 남겨본다.
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
}
