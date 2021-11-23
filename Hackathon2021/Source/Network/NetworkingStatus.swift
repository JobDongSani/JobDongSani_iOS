//
//  NetworkingStatus.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/22.
//

import Foundation

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
