//
//  ViewController.swift
//  Publisher
//
//  Created by Amber on 10/12/21.
//

import UIKit
import FirebaseFirestore


class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Publisher"
        
        
    }


    func configure() {
        addSubview(UIButton)
    }
    
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}
