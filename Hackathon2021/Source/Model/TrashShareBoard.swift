//
//  TrashShareBoard.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import Foundation
class trashShareBoard : Codable{
    let status: Int
    let message : String
    let data : [trashShareBoardData]
}
struct trashShareBoardData : Codable{
    let id : Int
    let title : String
    let contentes: String
    let contact : String
    let imagePath : String
    let location : String
    let writer : String
}
final class trashShareBoardAPI : API<trashShareBoardData>{
    static let shared = trashShareBoardAPI()
}
