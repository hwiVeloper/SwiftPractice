//
//  MemoCell.swift
//  MyMemory
//
//  Created by Jonghwi Lee on 2017. 12. 1..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import UIKit

class MemoCell: UITableViewCell {
    @IBOutlet var subject: UILabel! // 제목
    @IBOutlet var contents: UILabel! // 내용
    @IBOutlet var regdate: UILabel! // 등록일자
    @IBOutlet var img: UIImageView! // 이미지
}
