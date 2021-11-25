//
//  API.swift
//  Hackathon2021
//
//  Created by Ji-hoon Ahn on 2021/11/22.
//

import Foundation
import Alamofire
import UIKit

//MARK: - API Service !
class API<D : Decodable>{

    //MARK: - Request Method
    func Request(url : String ,method : HTTPMethod, param : Parameters?, header : HTTPHeaders?,JSONDecodeUsingStatus: Bool,completion: @escaping(NetworkResult<Any>) ->  Void){
        let dataRequest = AF.request("http://\(BaseURL.baseURL)\(url)",
                                     method: method,
                                     parameters: param,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseJSON { (response) in
            print("\(response.result)")
            switch response.result{
            case.success(let success):
                NSLog("Success : \(success)")
                guard let statusCode = response.response?.statusCode else {return}
                print(statusCode)
                guard let value = response.data else { return }
                let networkResult = self.judgeStatus(by: statusCode, value, JSONDecodeUsingStatus)
                completion(networkResult)
            case.failure(let err):
                NSLog("Fail : \(err.localizedDescription)")
                completion(.pathErr)
            }
        }
    }
    //MARK: - Data Request Status
    private func judgeStatus(by  statusCode : Int, _ data : Data, _ JSONDecodeUsingStatus: Bool) -> NetworkResult<Any>{
        switch statusCode{
        case 200 :
            return methodStatus( data: data, JSONDecodeUsingStatus: JSONDecodeUsingStatus)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    //MARK: - Method Type
    private func methodStatus( data : Data, JSONDecodeUsingStatus: Bool) -> NetworkResult<Any>{
        switch JSONDecodeUsingStatus{
        case true:
            return isValidData(data)
        case false:
            return .success(data)
        }
    }
    //MARK: - JSONDecoder
    private func isValidData(_ data : Data) -> NetworkResult<Any>{
        let decoder = JSONDecoder()
        guard let dataDecoder = try? decoder.decode(D.self, from: data) else {return .pathErr}
        print(dataDecoder)
        return .success(dataDecoder)
    }
}

