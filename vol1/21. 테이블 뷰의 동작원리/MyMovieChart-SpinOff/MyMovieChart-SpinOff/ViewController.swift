//
//  ViewController.swift
//  MyMovieChart-SpinOff
//
//  Created by Jonghwi Lee on 2017. 5. 30..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // 다중 클래스 상속은 지원하지 않지만, 프로토콜 implements는 허용됨

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 // 임시로 5개 생성
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "\(indexPath.row)번째 데이터입니다."
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("\(indexPath.row)번 째 데이터가 클릭됨")
    }
    
    // Table View와 ViewController를 연결한다.
    // dataSource, delegate
    // 그래야 tableView 함수를 참조하여 호출하는 것이 가능하다.
}

