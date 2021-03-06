//
//  Json_Response_2.swift
//  iOS_Networking_2
//
//  Created by kim jong moon on 06/03/2021.
//

import Foundation

struct Response_2: Decodable {
    var a : String?
    var orders: [Orders]?
}
struct Orders: Decodable {
    var orderno : String?
    var date : String?
    var trackingno : String?
    var custid : String?
    var customer : [Customer]?
}
struct Customer: Decodable {
    var custid : String?
    var fname : String?
    var lname : String?
    var address : String?
    var city : String?
    var state : String?
    var zip : String?
}

