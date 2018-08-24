//
//  JoinVC.swift
//  MyMemory
//
//  Created by Jonghwi Lee on 2018. 8. 25..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class JoinVC: UIViewController, UITableViewDataSource, UITableViewDelegate,
        UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet var profile: UIImageView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var indicatorView: UIActivityIndicatorView!
    
    // 테이블 뷰에 들어갈 텍스트 필드
    var fieldAccount: UITextField!
    var fieldPassword: UITextField!
    var fieldName: UITextField!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // 프로필 이미지를 원형으로 설정
        self.profile.layer.cornerRadius = self.profile.frame.width / 2
        self.profile.layer.masksToBounds = true
        
        // 프로필 이미지에 제스쳐 액션 이벤트 설정
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedProfile(_:)))
        self.profile.addGestureRecognizer(gesture)
        
        self.view.bringSubview(toFront: self.indicatorView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        // 각 테이블 뷰 셀 모두에 공통적용될 프레임 객체
        let tfFrame = CGRect(x: 20, y: 0, width: cell.bounds.width, height: 37)
        
        switch indexPath.row {
            case 0:
                self.fieldAccount = UITextField(frame: tfFrame)
                self.fieldAccount.placeholder = "계정(이메일)"
                self.fieldAccount.borderStyle = .none
                self.fieldAccount.autocapitalizationType = .none
                self.fieldAccount.font = UIFont.systemFont(ofSize: 14)
                cell.addSubview(self.fieldAccount)
            case 1:
                self.fieldPassword = UITextField(frame: tfFrame)
                self.fieldPassword.placeholder = "비밀번호"
                self.fieldPassword.borderStyle = .none
                self.fieldPassword.isSecureTextEntry = true
                self.fieldPassword.font = UIFont.systemFont(ofSize: 14)
                cell.addSubview(self.fieldPassword)
            case 2:
                self.fieldName = UITextField(frame: tfFrame)
                self.fieldName.placeholder = "이름"
                self.fieldName.borderStyle = .none
                self.fieldName.font = UIFont.systemFont(ofSize: 14)
                cell.addSubview(self.fieldName)
            default:
                self.fieldAccount = UITextField(frame: tfFrame)
                self.fieldAccount.placeholder = "계정(이메일)"
                self.fieldAccount.borderStyle = .none
                self.fieldAccount.autocapitalizationType = .none
                self.fieldAccount.font = UIFont.systemFont(ofSize: 14)
                cell.addSubview(self.fieldAccount)
                ()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    @IBAction func submit(_ sender: Any) {
        self.indicatorView.startAnimating()
        
        // 전달할 값 준비
        let profile = UIImagePNGRepresentation(self.profile.image!)?.base64EncodedString()
        
        let param: Parameters = [
            "account": self.fieldAccount.text!,
            "passwd": self.fieldPassword.text!,
            "name": self.fieldName.text!,
            "profile_image": profile!
        ]
        
        // api 호출
        let url = "http://swiftapi.rubypaper.co.kr:2029/userAccount/join"
        let call = Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.default)
        
        call.responseJSON { res in
            // 인디케이터 애니메이션 종료
            self.indicatorView.stopAnimating()
            
            // JSON 형식으로 잘 전달했는지 확인
            guard let jsonObject = res.result.value as? [String: Any] else {
                self.alert("서버 호출 과정에서 오류가 발생했습니다")
                return
            }
            
            // 응답코드확인 (0은 성공)
            let resultCode = jsonObject["result_code"] as! Int
            if resultCode == 0 {
                self.alert("가입이 완료되었습니다.")
            } else {
                let errorMsg = jsonObject["error_msg"] as! String
                self.alert("오류 발생 : \(errorMsg)")
            }
        }
    }
    
    @objc func tappedProfile(_ sender: Any) {
        let msg = "프로필 이미지를 읽어올 곳을 선택하세요."
        let sheet = UIAlertController(title: msg, message: nil, preferredStyle: .actionSheet)
        
        sheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        sheet.addAction(UIAlertAction(title: "저장된 앨범", style: .default) { (_) in
            selectLibrary(src: .savedPhotosAlbum)
        })
        sheet.addAction(UIAlertAction(title: "포토 라이브러리", style: .default) { (_) in
            selectLibrary(src: .photoLibrary)
        })
        sheet.addAction(UIAlertAction(title: "카메라", style: .default) { (_) in
            selectLibrary(src: .camera)
        })
        self.present(sheet, animated: true)
        
        func selectLibrary(src: UIImagePickerControllerSourceType) {
            if UIImagePickerController.isSourceTypeAvailable(src) {
                let picker = UIImagePickerController()
                picker.delegate = self
                picker.allowsEditing = true
                
                self.present(picker, animated: false)
            } else {
                self.alert("사용할 수 없는 타입입니다.")
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.profile.image = img
        }
        self.dismiss(animated: true)
    }
}
