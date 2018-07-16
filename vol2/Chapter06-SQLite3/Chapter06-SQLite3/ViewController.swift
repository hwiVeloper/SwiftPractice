//
//  ViewController.swift
//  Chapter06-SQLite3
//
//  Created by Jonghwi Lee on 2018. 7. 17..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        var db: OpaquePointer? = nil // SQLite 연결 정보를 담을 객체
        var stmt: OpaquePointer? = nil // 컴파일된 SQL을 담을 객체
        
        // 앱 내 문서 디렉터리 경로에서 SQLite DB 파일을 찾는다.
//        let fileMgr = FileManager()
//        let docPathURL = fileMgr.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let dbPath = docPathURL.appendingPathComponent("db.sqlite").path
        let dbPath = "/Users/Hwi/db.sqlite"
        
        let sql = "CREATE TABLE IF NOT EXISTS sequence (num INTEGER)"
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK { // db 연결 성공시
            if sqlite3_prepare(db, sql, -1, &stmt, nil) == SQLITE_OK { // SQL 컴파일이 성공시
                if sqlite3_step(stmt) == SQLITE_DONE {
                    print("Create Table Success!")
                }
                sqlite3_finalize(stmt)
            } else {
                print("Prepare Statement Fail!")
            }
            
            // db 연결 해제
            sqlite3_close(db)
        } else {
            print("Database Connect Fail!")
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

