//
//  model.swift
//  Publisher
//
//  Created by Amber on 10/12/21.
//

import Foundation
import FirebaseFirestore

struct Article {
    
    let author: [authorItem]
    let title: String
    let content: String
    let createdTime: Timestamp
    let id: String
    let category: String
    
}

struct authorItem: Codable, Identifiable   {
    
    let email: String
    let id: String
    let name: String

}
