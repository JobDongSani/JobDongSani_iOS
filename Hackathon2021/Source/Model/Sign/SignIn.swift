//
//  signin.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import Foundation

class SigninModel : Codable{
    let status : Int
    let message : String
    let data : SigninTokenModel
}
struct SigninTokenModel : Codable{
    let accessToken : String
}

final class SigninRequest : API<SigninModel>{
    static let shared = SigninRequest()
}
