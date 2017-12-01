//
//  TheaterListController.swift
//  MyMovieChart
//
//  Created by Jonghwi Lee on 2017. 5. 30..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class TheaterListController : UITableViewController {
    // API를 통한 데이터를 저장할 변수
    var list = [NSDictionary]()
    
    // 읽어올 데이터 시작 위치
    var startPoint = 0
    
    // 뷰 로드시 극장 정보를 불러온다.
    override func viewDidLoad() {
        callTheaterAPI()
    }
    
    // API로부터 극장 정보 받아오는 메서드
    func callTheaterAPI() {
        // URL 상수값 선언
        let requestURI = "http://swiftapi.rubypaper.co.kr:2029/theater/list"
        let sList = 100 // 불러올 데이터 개수
        let type = "json" // 불러올 방식
        
        // 인자값으로 URL객체 정의
        let urlObj = URL(string: "\(requestURI)?s_page=\(self.startPoint)&s_list=\(sList)&type=\(type)")
        
        do {
            // NSString 객체를 이용하여 API를 호출하고 그 결과를 인코딩된 문자열로 받음
            let stringData = try NSString(contentsOf: urlObj!, encoding: 0x80_000_422)
            // 0x80_000_422 => EUC-KR
            
            // 받은 데이터를 utf-8로 인코딩 처리한 데이터로 변환
            let encData = stringData.data(using: String.Encoding.utf8.rawValue)
            
            do {
                // data 객체를 파싱하여 NSArray 객체로 변환
                let apiArray = try JSONSerialization.jsonObject(with: encData!, options: []) as? NSArray
                
                // 읽어온 데이터를 순회하면서 self.list 배열에 추가
                for obj in apiArray! {
                    self.list.append(obj as! NSDictionary)
                }
            } catch {
                // Error
                let alert = UIAlertController(title: "실패", message: "데이터 분석이 실패하였습니다.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .cancel))
                self.present(alert, animated: false)
            }
            
            // 읽어야 할 다음 데이터의 시작 위치를 기억시킨다.
            self.startPoint += sList
        } catch {
            // Error
            let alert = UIAlertController(title: "오류", message: "데이터를 불러오는 데 실패하였습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            
            self.present(alert, animated: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 배열에서 데이터를 꺼낸다.
        let obj = self.list[indexPath.row]
        
        // 재사용 큐로부터 tCell 식별자에 맞는 셀 객체를 전달받음
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "tCell") as! TheaterCell
        
        cell.name?.text = obj["상영관명"] as? String
        cell.tel?.text  = obj["연락처"] as? String
        cell.addr?.text = obj["주소"] as? String
        
        return cell
    }
}
