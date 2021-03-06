//
//  Post.swift
//  iOS_Networking_2
//
//  Created by kim jong moon on 06/03/2021.
//

import Foundation

struct Post: Decodable{
    
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
 
    init() {
        
    }
    
    init(title: String,body: String) {
        self.userId = 1
        self.id = 1
        self.title = title
        self.body = body
    }
    
}
