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
        ("해리포터7", "해리포터 마지막편", "2015-01-01", 9.77),
        ("반지의 제왕: 왕의 귀환", "반지의 제왕 마지막편", "2013-05-28", 9.88),
        ("너의 이름은", "키미노 나마에와", "2016-12-25", 8.66)
    ]
    
    lazy var list : [MovieVO] = {
        var datalist = [MovieVO]()
        
        for (title, description, opendate, rating) in self.dataset {
            let mvo = MovieVO()
            
            mvo.title = title
            mvo.description = description
            mvo.opendate = opendate
            mvo.rating = rating
            
            datalist.append(mvo)
        }
        
        return datalist
    } ()
    
//    override func viewDidLoad() {
//        var mvo = MovieVO()
//        mvo.title = "해리포터1"
//        mvo.description = "해리포터와 마법사의 돌"
//        mvo.opendate = "2010-01-01"
//        mvo.rating = 9.87
//        self.list.append(mvo)
//        
//        mvo = MovieVO()
//        mvo.title = "해리포터2"
//        mvo.description = "해리포터와 비밀의 방"
//        mvo.opendate = "2011-01-01"
//        mvo.rating = 9.99
//        self.list.append(mvo)
//        
//        mvo = MovieVO()
//        mvo.title = "해리포터3"
//        mvo.description = "해리포터와 아즈카반의 죄수"
//        mvo.opendate = "2012-01-01"
//        mvo.rating = 7.49
//        self.list.append(mvo)
//        
//        mvo = MovieVO()
//        mvo.title = "해리포터4"
//        mvo.description = "해리포터와 불의 잔"
//        mvo.opendate = "2013-01-01"
//        mvo.rating = 8.60
//        self.list.append(mvo)
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        NSLog("\(self.list.count)")
        return self.list.count // 생성해야 할 행의 개수
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 개별 행을 만드는 역할을 한다. 위에 메서드에서 반환된 값만큼 반복수행된다.
        // 주어진 행에 맞는 데이터 소스를 read
        let row = self.list[indexPath.row]
        
        // 테이블 셀 객체를 직접 생성하지 않고 대신 큐로부터 가져옴
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        
        cell.textLabel?.text = row.title // 제목
        cell.detailTextLabel?.text = row.description // 상세 내용
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 행이 선택되었을 때 로그를 남겨본다.
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
}
