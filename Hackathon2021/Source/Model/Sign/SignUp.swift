//
//  SignUp.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/25.
//

import Foundation

struct SignUpModel : Codable{
    let username : String
    let password : String
    let name : String
    let phoneNumber : String
    let userImage : String
}

final class SignUpRequest : API<SignUpModel>{
    static let shared = SignUpRequest()
}
