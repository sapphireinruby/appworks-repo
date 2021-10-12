//
//  ViewController.swift
//  FirebaseProject
//
//  Created by Amber on 9/22/21.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift


struct Data: Codable, Identifiable {
    
    let id: String
    let title: String
    let content: String
    let tag: String
    let author_id: String
    let created_time: Timestamp
    
//    enum CodingKeys: String, CodingKey {
//    這樣寫會抓不到其他人的資料 因為下面兩個轉碼的型態改變了
//    所以抓不到別人輸入的格式
//
//        case id
//        case title
//        case content
//        case tag
//        case author_id = "authorID"
//        case created_time
//    }
}


class ViewController: UIViewController {

    let timeStamp = Timestamp(date: Date())
   
    
    
    @IBOutlet weak var textView: UITextView!
    

    @IBAction func postButton(_ sender: Any) {
        
        guard let title = titleTestField.text else { return }
        guard let content = contentTextField.text else { return }
        guard let tag = tagSegment.titleForSegment(at: tagSegment.selectedSegmentIndex) else {return}
        
        let ref = db.collection("Articles").document()
        
        let newPost = Data (
            id: ref.documentID,
            title: title,
            content: content,
            tag: tag,
            author_id: "Amber",
            created_time: timeStamp
        )
        
        do {
//            try db.collection("Article").document("id:66").setData(from: newPost)
            try ref.setData(from: newPost)
            
        }
        catch {
            print("catch Error")
        }
        
  
    }
    
    
    @IBOutlet weak var titleTestField: UITextField!
    
    @IBOutlet weak var contentTextField: UITextField!

    @IBOutlet weak var tagSegment: UISegmentedControl!
    
    
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        
        //fetchData()
        
        //checkPostChange()
 
    }

    func fetchData() {
        //let db = Firestore.firestore()
        
        db.collection("Articles").getDocuments { snapshot, error in
                
             guard let snapshot = snapshot else { return }
            
            snapshot.documents.forEach { snapshot in
                guard let snapshotFetch = try? snapshot.data(as: Data.self) else {  return}

                print(snapshotFetch)
                    
                }
             }

    }
    
    
    func checkPostChange() {
        let db = Firestore.firestore()
        db.collection("Articles").addSnapshotListener { snapshot, error in
            guard let snapshot = snapshot else { return }
            snapshot.documentChanges.forEach { documentChange in
                
                if  documentChange.type == .added {
                    
                    do {
                        guard let postFromOthers = try documentChange.document.data(as: Data.self) else { return }
                        print(postFromOthers)
                        print("added")
                        
                    } catch let error{
                        print(error)
                    }

                }
                
                
            }
        }
    }
    
    
    func createSameIDAsDoc() {   //目前沒有呼叫
            let newIDRef = db.collection("data").document()
            newIDRef.setData( [
                "id" : newIDRef.documentID,
                "title" : titleTestField.text!,
                "content" : contentTextField.text!,
//                "tag" : tag,
                "author_id" : "Amber",
                "created_time" : timeStamp
            ]) { (error) in
                if let error = error {
                    print(error)
                }
            }
        }
    }
    



