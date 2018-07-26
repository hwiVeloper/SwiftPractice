//
//  DepartmentInfoVC.swift
//  Chapter06-HR
//
//  Created by Jonghwi Lee on 2018. 7. 24..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class DepartmentInfoVC: UITableViewController {    
    // 부서 정보를 저장할 데이터 타입
    typealias DepartRecord = (departCd: Int, departTitle: String, departAddr: String)
    
    // 부서 목록으로부터 넘겨 받을 부서 코드
    var departCd: Int!
    
    // DAO 객체
    let departDAO = DepartmentDAO()
    let empDAO = EmployeeDAO()
    
    // 부서 정보와 사원 목록을 담을 멤버 변수
    var departInfo: DepartRecord!
    var empList: [EmployeeVO]!
    
    override func viewDidLoad() {
        self.departInfo = self.departDAO.get(departCd: self.departCd)
        self.empList = self.empDAO.find(departCd: self.departCd)
        
        self.navigationItem.title = "\(self.departInfo.departTitle)"
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else {
            return self.empList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if indexPath.section == 0 { // 부서 정보 영역
            let cell = tableView.dequeueReusableCell(withIdentifier: "DEPART_CELL")
            
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 13)
            cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: 12)
            
            switch indexPath.row {
                case 0:
                    cell?.textLabel?.text = "부서 코드"
                    cell?.detailTextLabel?.text = "\(self.departInfo.departCd)"
                case 1:
                    cell?.textLabel?.text = "부서명"
                    cell?.detailTextLabel?.text = self.departInfo.departTitle
                case 2:
                    cell?.textLabel?.text = "부서 주소"
                    cell?.detailTextLabel?.text = self.departInfo.departAddr
                default:
                    () // 작성할 구문이 없는 경우 더미코드
            }
            return cell!
        } else { // 소속 사원 영역
            let row = self.empList[indexPath.row]
            
            // 테이블 뷰 셀 설정
            let cell = tableView.dequeueReusableCell(withIdentifier: "EMP_CELL")
            cell?.textLabel?.text = "\(row.empName) (입사일: \(row.joinDate))"
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
            
            // 재직 상태를 나타내는 세그먼트 컨트롤
            let state = UISegmentedControl(items: ["재직중", "휴직", "퇴사"])
            state.frame.origin.x = self.view.frame.width - state.frame.width - 10
            state.frame.origin.y = 10
            state.selectedSegmentIndex = row.stateCd.rawValue
            
            // 추가 구문
            state.tag = row.empCd
            state.addTarget(self, action: #selector(self.changeState(_:)), for: .valueChanged)
            
            cell?.contentView.addSubview(state)
            return cell!
        }
    }
    
    @objc func changeState(_ sender: UISegmentedControl) {
        // 1. 사원 코드
        let empCd = sender.tag
        // 2. 재직 상태
        let stateCd = EmpStateType(rawValue: sender.selectedSegmentIndex)
        
        // 재직 상태 업데이트
        if self.empDAO.editState(empCd: empCd, stateCd: stateCd!) {
            let alert = UIAlertController(title: nil, message: "재직 상태가 변경되었습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
        }
    }
}
