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
    
    // 더보기를 위해 페이지 정보 추가
    var page = 1
    
    lazy var list : [MovieVO] = {
        var datalist = [MovieVO]()
        
        return datalist
    } ()
    
    // 더보기 버튼
    @IBOutlet var moreBtn: UIButton!
    
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
        NSLog("호출된 행번호 : \(indexPath.row), 제목 : \(row.title)")
        
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        // 이미지 객체 대입
//        cell.thumbnail.image = row.thumbnailImage
        // ===== MovieCell을 이용한 케이스 끝
        
        // 비동기 방식으로 이미지를 읽어옴
        DispatchQueue.main.async(execute: {
            NSLog("비동기 방식으로 읽어옵니다. (순서를 보장받지 못함)")
            cell.thumbnail.image = self.getThumbnailImage(indexPath.row)
        })
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 행이 선택되었을 때 로그를 남겨본다.
        NSLog("선택된 행은 \(indexPath.row)번째 행입니다.")
    }
    
    override func viewDidLoad() {
        callMovieAPI()
    }
    @IBAction func more(_ sender: Any) {
        // 페이지 값 추가
        self.page += 1
        
        callMovieAPI()
        
        // 데이터를 다시 읽어오도록 테이블 뷰 갱신
        self.tableView.reloadData()
    }
    
    func callMovieAPI() {
        // API 호출을 위한 URI 생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=10&genreId=&order=releasedateasc"
        let apiURI : URL! = URL(string: url)
        
        // API 호출
        let apidata = try! Data(contentsOf: apiURI)
        
        // JSON 객체를 파싱하여 NSDictionary 객체로 받는다.
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 데이터 구조에 따라 차례대로 캐스팅하여 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // Iterator 처리를 하면서 API 데이터를 MovieVO 객체에 저장
            for row in movie {
                // 순회 상수를 NSDictionary 타입으로 캐스팅
                let r = row as! NSDictionary
                
                // 테이블 뷰 리스트를 구성할 방식
                let mvo = MovieVO()
                
                // movie 각 배열에 데이터를 mvo에 할당
                mvo.title = r["title"] as? String
                mvo.description = r["genreNames"] as? String
                mvo.thumbnail = r["thumbnailImage"] as? String
                mvo.detail = r["linkUrl"] as? String
                mvo.rating = (r["ratingAverage"] as! NSString).doubleValue
                
                // =====> 추가 코드 : 웹상 이미지를 읽어와서 저장
                let url: URL! = URL(string: mvo.thumbnail!)
                let imageData = try! Data(contentsOf: url)
                mvo.thumbnailImage = UIImage(data: imageData)
                // <===== 이미지 읽기 끝
                
                // list 배열에 추가
                self.list.append(mvo)
                
                // 전체 데이터에 대한 카운트
                let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
                
                // totalCount가 읽어온 데이터 크기와 같거나 큰 경우 -> 더보기 버튼 숨김
                if(self.list.count >= totalCount) {
                    self.moreBtn.isHidden = true
                }
            }
        } catch {
            NSLog("Parse Error!")
        }
    }
    
    func getThumbnailImage(_ index : Int) -> UIImage {
        // 인자값으로 받은 인덱스를 기반으로 해당하는 배열 데이터를 읽어온다.
        let mvo = self.list[index]
        
        // 메모이제이션 : 저장된 이미지가 있으면 반환, 없으면 다운로드 후 반환
        if let savedImage = mvo.thumbnailImage {
            return savedImage
        } else {
            let url: URL! = URL(string: mvo.thumbnail!)
            let imageData = try! Data(contentsOf: url)
            mvo.thumbnailImage = UIImage(data: imageData) // UIImage를 MovieVO 객체에 우선 저장
            
            return mvo.thumbnailImage!
        }
    }
}
