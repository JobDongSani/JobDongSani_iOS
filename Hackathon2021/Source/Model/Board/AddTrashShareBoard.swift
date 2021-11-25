//
//  AddTrashShareBoard.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/26.
//

import Foundation

class AddTrashShareBoard : Codable{
    let data : Int
    let message : String
    let status : Int
}
final class AddTrashShareBoardAPI : API<AddTrashShareBoard>{
    static let shared = AddTrashShareBoardAPI()
}
