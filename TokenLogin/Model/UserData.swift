//
//  UserData.swift
//  TokenLogin
//
//  Created by SeungKyu on 2023/05/24.
//

import Foundation

struct UserData : Codable,Identifiable{
    var uuid: UUID = UUID()
    var id : Int
    var name : String
    var email : String
    var avatar : String
    private enum CodingKeys: String, CodingKey{
        case id
        case name
        case email
        case avatar
    }
}
