//
//  TrashShareBoard.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import Foundation
class trashShareBoard : Codable{
    let data : [trashShareBoardModel]
}
struct trashShareBoardModel : Codable{
    let id : Int
    let title ,writer,imagePath,location,contact,contents: String
}

final class trashShareBoardAPI : API<trashShareBoard>{
    static let shared = trashShareBoardAPI()
}
