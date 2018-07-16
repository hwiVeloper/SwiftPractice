//
//  TutorialContentsVC.swift
//  MyMemory
//
//  Created by Jonghwi Lee on 2018. 7. 16..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation

class TutorialContentsVC: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bgImageView: UIImageView!
    
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    
    override func viewDidLoad() {
        // 전달받은 타이틀 정보를 레이블 객체에 대입하고 크기를 조절한다.
        self.titleLabel.text = self.titleText
        self.titleLabel.sizeToFit()
        
        // 전달받은 이미지 정보를 이미지 뷰에 대입한다.
        self.bgImageView.image = UIImage(named: self.imageFile)
    }
}
