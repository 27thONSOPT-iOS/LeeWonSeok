//
//  SignUpService.swift
//  SOPT27_week6_assignment
//
//  Created by 이원석 on 2020/11/26.
//

import Foundation
import Alamofire

struct SignUpService {
    static let shared = SignUpService()
    
    func signup(email: String, password: String, userName: String, completion: @escaping (NetworkResult<Any>) -> (Void)){
                    
        let url = APIConstants.usersSignUpURL
        let header: HTTPHeaders = [
            "Content-Type":"application/json"
        ]
        let body: Parameters = [
            "email":email,
            "password":password,
            "userName":userName
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        // reponse? 통신의 결과
        dataRequest.responseData { (response) in
            // 통신의 성공/실패에 따른 분기처리
            switch response.result {
            
            // 통신의 결과에 따라 statusCode와 value값을 가지게 된다
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    return
                }
                guard let data = response.value else {
                    return
                }
                
                completion(judgeSignInData(status: statusCode, data: data))
                
            case .failure(let err):
                print(err)
                completion(.networkFail)
            
            }
        }
        
    }
    
    private func judgeSignInData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try?decoder.decode(GenericResponse<SignInData>.self, from: data) else
        {
            return.pathErr
        }
        
        switch status {
        case 200:
            return .success(decodedData.data)
        case 400:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .pathErr
        }
    }
    
}
