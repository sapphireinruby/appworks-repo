//
//  PublishViewController.swift
//  Publisher
//
//  Created by Amber on 10/12/21.
//

import UIKit
import FirebaseFirestore

var db: Firestore!

class PublishViewController: UIViewController {
    
    let timeStamp = Timestamp(date: Date())
    
    @IBOutlet weak var titleInputTxtField: UITextField!
    
    @IBOutlet weak var categoryInputTextField: UITextField!
    
    @IBOutlet weak var contentInputTextField: UITextField!
    
    @IBAction func saveArticleBtn(_ sender: UIButton) {
        
        let articles = Firestore.firestore().collection("articles")
        let document = articles.document()
        
        guard
            let title = titleInputTxtField.text,
            let category = categoryInputTextField.text,
            let content = contentInputTextField.text
                
        else { return }
        
        
        let article = Article(author:["wayne@school.appworks.tw", "waynechen323", "小安老師"], title: title, content: content, createdTime: timeStamp, id: document.documentID, category: category)
                            
        addData()
    }
    
    
    func addData() {
        
   let articles = Firestore.firestore().collection("articles") // 資料的路徑
        
   let document = articles.document() // 建立新document
        
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
                              
                              
        override func viewDidLoad() {
            super.viewDidLoad()
            
            db = Firestore.firestore()
        }
                              
                              
       func CheckAuthor() {
            
            db.collection("articles").where("id",  "==", author.uid) //若有users 的id 和輸入的文字一樣
                .getDocuments() { (querySnapshot, err) in  //  尋找有沒有這個使用者，有就抓他的資料
                    
                    if let err = err {
                        print("Error finding author: \(err)")
                        
                    } else {
                        for document in querySnapshot!.documents {
                            
                            documentID = document.documentID
                            
                            print("\(document.documentID) => \(document.data())") // 透過id 把整筆資料列出來
                            
                        }
                    }
                }
        }
        
        
    }
