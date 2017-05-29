//
//  ViewController.swift
//  Delegate-ImagePicker
//
//  Created by Jonghwi Lee on 2017. 5. 26..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var imageView: UIImageView!

    @IBAction func pick(_ sender: Any) {
        // 이미지 피커 인스턴스 생성
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true;
        
        // 델리게이트 지정
        picker.delegate = self
        
        self.present(picker, animated: false)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // 이미지를 선택하지 않고 취소 했을 때
        
        // 이미지 피커 컨트롤러 창 닫기
        picker.dismiss(animated: false)
        
        // 알림창 호출
        let alert = UIAlertController(title: "", message: "이미지 선택이 취소되었습니다.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: false)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 이미지를 선택했을 때
        picker.dismiss(animated: false) {
            (_) in
            // 이미지(수정된)를 이미지 뷰에 표시
            let img = info[UIImagePickerControllerEditedImage] as? UIImage
            self.imageView.image = img
        }
    }
}

