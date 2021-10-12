//
//  ViewController.swift
//  RowApp
//
//  Created by Amber on 8/18/21.
//

import UIKit

class RowViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: DataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RowCell", for: indexPath)
        let rowInfo = RowInfo(
            Section: "This is section \(indexPath[0]), row \(indexPath[1])"
            //indexPath: from section 0, row 0 , indexPath[0]:section, indexPath[1]: row
        )
        cell.textLabel?.text = rowInfo.Section
        return cell
    }
    
}

