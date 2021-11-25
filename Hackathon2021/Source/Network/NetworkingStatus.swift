//
//  NetworkingStatus.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/22.
//

import Foundation

enum NetworkResult<Network> {
    case success(Network)
    case requestErr(Network)
    case pathErr
    case serverErr
    case networkFail
}
