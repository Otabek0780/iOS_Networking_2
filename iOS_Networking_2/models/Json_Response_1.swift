//
//  Json_Response_1.swift
//  iOS_Networking_2
//
//  Created by kim jong moon on 06/03/2021.
//

import Foundation

struct Response_1: Decodable {
    
    var time: String?
    var uptime: Int?
    var vcc: Int?
    var power: String?
    var wifi: [Wifi]?
}
struct Wifi: Decodable {
    
    var ap: Int?
    var ssd: String?
    var rss: Int?
    var apMac: String?

}
