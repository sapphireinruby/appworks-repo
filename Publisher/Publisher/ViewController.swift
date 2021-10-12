//
//  ViewController.swift
//  Publisher
//
//  Created by Amber on 10/12/21.
//

import UIKit
import FirebaseFirestore
import ESPullToRefresh


class ViewController: UIViewController {
    
    var db: Firestore!
    
    // fetch data 把 firebase 有的資料 顯示在tableView 上
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
    
        self.title = "Publisher"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ItemTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self

        
        var articles = [article]() {
            didSet {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        
        let articles = Firestore.firestore().collection("articles") // 資料的路徑
        articles.getDocuments { snapshot, error in
            
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
        }
             
        let document = articles.document() // 建立新document
        
        //~~~~~~~~~~  Pull to Refresh  ~~~~~~~~~~
        self.tableView.es.addPullToRefresh {
            [unowned self] in
            
            articles.data.removeAll()
            
            //更新的時候重新整理
            self.tableView.reloadData()
            // 刷新成功，设置completion自动重置footer的状态
            self.tableView.es.stopPullToRefresh()
            // 设置ignoreFooter来处理不需要显示footer的情况
            self.tableView.es.stopPullToRefresh(ignoreDate: true, ignoreFooter: false)
        }

    }
    


    // MARK: Properties
    var articles: [Article] = []
    
    func addData() {
        
        
   let data: [String: Any] = [  // value是any
    
    "author": [
        
   "email": "wayne@school.appworks.tw",
   "id": "waynechen323",
   "name": "AKA小安老師"
   
   ],
    
   "title": "IU「亂穿」竟美出新境界!笑稱自己品味奇怪 網笑:靠顏值撐住女神氣場",
    
   "content": "南韓歌手IU(李知恩)無論在歌唱方面或是近期的戲劇作品都有亮眼的成績，但俗話說人無完美、美玉微瑕，曾再跟工作人員的互動影片中坦言自己品味很奇怪，近日在IG上分享了宛如「媽媽們青春時代的玉女歌手」超復古穿搭造型，卻意外美出新境界。",
    
    "createdTime": NSDate().timeIntervalSince1970,
    
   "id": document.documentID,
    
   "category": "Beauty"
    
   ]
        
   document.setData(data) }
    
}
    
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath)
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ItemTableViewCell")
        
        let article = articles[indexPath.row]

        cell.titleLbl.text = article.title
        cell.authorLbl.text = "小安老師"
        cell.categoryLbl.text = article.category
        cell.creatTimeLbl.text = timeStamp
        cell.articleTextView.text = article.content

        return cell
      }
}
    
    

extension ViewController: UITableViewDelegate {
    
}
