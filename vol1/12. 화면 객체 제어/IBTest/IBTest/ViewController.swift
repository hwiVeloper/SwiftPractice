//
//  ViewController.swift
//  IBTest
//
//  Created by Jonghwi Lee on 2017. 5. 7..
//  Copyright © 2017년 Jonghwi Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var uiTitle01: UILabel!
    @IBOutlet var uiTitle02: UILabel!
    @IBOutlet var uiTitle03: UILabel!
    @IBOutlet var uiTitle04: UILabel!
    @IBOutlet var uiTitle05: UILabel!
    
    @IBAction func clickBtn01(_ sender: Any) {
        // 드래그 생성은 control + drag
        self.uiTitle01.text = "Button01 Clicked!"
    }
    
    @IBAction func clickBtn02(_ sender: Any) {
        self.uiTitle02.text = "Button02 Clicked!"
    }
    
    @IBAction func clickBtn03(_ sender: AnyObject) {
        self.uiTitle03.text = "Button03 Clicked!"
        
    }
    @IBAction func clickBtn04(_ sender: Any) {
        self.uiTitle04.text = "Button04 Clicked!"
    }
    
    @IBAction func clickBtn05(_ sender: Any) {
        self.uiTitle05.text = "Button05 Clicked!"
    }
}

