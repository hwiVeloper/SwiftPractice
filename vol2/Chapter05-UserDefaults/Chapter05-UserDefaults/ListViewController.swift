//
//  ListViewController.swift
//  Chapter05-UserDefaults
//
//  Created by Jonghwi Lee on 2018. 7. 4..
//  Copyright © 2018년 Jonghwi Lee. All rights reserved.
//

import Foundation
import UIKit

class ListViewController: UITableViewController {
    @IBOutlet var name: UILabel!
    @IBOutlet var gender: UISegmentedControl!
    @IBOutlet var married: UISwitch!
    
    @IBAction func changeGender(_ sender: UISegmentedControl) {
    }
    @IBAction func changeMarried(_ sender: Any) {
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return super.numberOfSections(in: tableView)
    }
}
