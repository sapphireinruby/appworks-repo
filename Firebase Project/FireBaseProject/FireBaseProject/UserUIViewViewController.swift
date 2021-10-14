//
//  UserUIViewViewController.swift
//  FirebaseProject
//
//  Created by Amber on 9/23/21.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

// 建立一個資料的格式 

struct User: Codable, Identifiable  {
    
    let id: String
    let email: String
    let name: String
    
}

var db: Firestore!

class UserUIViewViewController: UIViewController {
    
    
    // MARK: -- viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        db = Firestore.firestore()
        
        //在啟動app要檢查offline時的事情
        checkInvitations()
        fetchInvitation()
        
    }
    
    
    // MARK: -- Search Users and Send Invitation
    
    var userID: String = ""
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func SearchBtn(_ sender: Any) {
        
        guard let  emailTextField = emailTextField.text else { return }
        
        db.collection("Users").whereField("email", isEqualTo: emailTextField) //若有users 的email 和輸入的文字一樣
            .getDocuments() { (querySnapshot, err) in  //  尋找有沒有這個使用者，有就抓他的資料
                
                if let err = err {
                    print("Error finding User email: \(err)")
                    
                } else {
                    for document in querySnapshot!.documents {
                        
                        self.userID = document.documentID    // 指定documentID 為userID
                        
                        print("\(document.documentID) => \(document.data())") // 透過id 把整筆資料列出來
                        
                    }
                }
            }
    }
    
    
    @IBAction func SendInvite(_ sender: Any) {
        // 寫入資料
        
        db.collection("Users").document(userID).collection("invitation").document("userId_Amber").setData([
            
            "id": "userId_Amber",
            "email": "amber@fake.com",
            "name": "Amber"
            
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Invitation successfully sent!")
            }
        }
        
    }
    
    // MARK: -- Fetch and Listen Invitations
    
    func fetchInvitation() {
        //let db = Firestore.firestore()
        
        let db = Firestore.firestore()
        
        db.collection("Users").document("userId_Amber").collection("invitation").addSnapshotListener { snapshot, error in
            
            guard let snapshot = snapshot else { return }
            snapshot.documentChanges.forEach { documentChange in //爭測是否有改變
                
                switch documentChange.type {
                    
                case .added:
                    
                    //印出有新增的項目
                    guard let invitation = try? documentChange.document.data(as: User.self) else { break }
                    print("More Invitations! \(invitation)")
                    
                    //print("New Invitations added")
                    
                case .modified:
                    print("Invitations modified")
                    
                case .removed:
                    print("Invitations removed")
                }
            }
        }
        
        
    }
    
    func checkInvitations() {
        
        let db = Firestore.firestore()
        db.collection("Users").document("userId_Amber").collection("invitation").addSnapshotListener { snapshot, error in
            
            guard let snapshot = snapshot else { return }
            
            snapshot.documentChanges.forEach { documentChange in
                
                if  documentChange.type == .added {
                    
                    do {
                        db.collection("Users").document("userId_Amber").collection("invitation").getDocuments() { (querySnapshot, err) in
                            
                            if let err = err {
                                print("Error finding User email: \(err)")
                                
                            } else {
                                for document in querySnapshot!.documents {
                                    
                                    self.userID = document.documentID
                                    
                                    print("You have new invites, here's all \(document.documentID) => \(document.data())")
                                }
                            }
                        }
                        //print("New Invitations! \(newInvitation)")
                        
                    } catch let error{
                        print(error)
                    }
                    
                }
                
            }
        }
    }
    
    
    // MARK: -- Handle Invitations
    
    var invitationDocIDArr = [String]()
    
    
    @IBAction func AcceptInvitations(_ sender: UIButton) {
        
        db.collection("Users").document("userId_Amber").collection("invitation").getDocuments() { [self] (querySnapshot, err) in
            if let err = err {
     
                print("Error getting Amber's invitation documents: \(err)")
            } else {
                
                for document in querySnapshot!.documents {
                    // 抓對方寄來邀請的資料
                    
                    guard let name = document.get("name") as? String,
                          let id = document.get("id") as? String,
                          let email = document.get("email") as? String else {
                              print("can't get invitation document")
                              return
                          }
                    
                    // 把邀請下面的資料 加進自己的friendList
                    db.collection("Users").document(id ).collection("friendList").document("userId_Amber").setData([
                        
                        "id": id,
                        "email": email,
                        "name": name
                        
                    ])
                    
                    // 把自己的資料 加進朋友的 friendList
                    db.collection("Users").document(id ).collection("friendList").document(id).setData([
                        
                        "id": "userId_Amber",
                        "email": "amber@fake.com",
                        "name": "Amber"
                        
                    ])
                    
                }
            }
        }
        
    }
    
    
    
    //remove invitation 
    
    @IBAction func CleanInvitations(_ sender: UIButton) {
        
        db.collection("Users").document("userId_Amber").collection("invitation").getDocuments() { [self] (querySnapshot, err) in
            if let err = err {
                
                print("Problem removing Amber's invitation documents: \(err)")
            } else {
                
                for document in querySnapshot!.documents {
                    
                    guard
                        let id = document.get("id") as? String else {
                            print("can't get invitation document")
                            return
                        }
                    
                    db.collection("Users").document("userId_Amber").collection("invitation").document(id).delete() { err in
                        if let err = err {
                            
                            print("Error removing invitation: \(err)")
                            
                        } else {
                            
                            print("Amber's invitation successfully removed!")
                        }
                    }
                    
                }
            }
        }
        
    } // end of func CleanInvitations
    
}





