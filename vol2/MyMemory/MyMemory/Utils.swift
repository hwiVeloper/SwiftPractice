//
//  Utils.swift
//  MyMemory
//
//  Created by Jonghwi Lee on 2018. 7. 16..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation

extension UIViewController {
    var tutorialSB: UIStoryboard {
        return UIStoryboard(name: "Tutorial", bundle: Bundle.main)
    }
    func instanceTutorialVC(name: String) ->UIViewController? {
        return self.tutorialSB.instantiateViewController(withIdentifier: name)
    }
}
