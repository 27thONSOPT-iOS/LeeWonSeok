//
//  LoginService.swift
//  
//
//  Created by 이원석 on 2020/11/26.
//

import Foundation
import Alamofire

struct LoginService {
    static let shared = LoginService()
    
    // 로그인 통신에 대한 함수 정의
    func signIn(email: String, password: String, completion: @escaping (NetworkResult<Any>) -> (Void)) {
        
        // 통신 URL
        let url = APIConstants.usersSignInURL
        
        // 요청 헤더
        let header: HTTPHeaders = [
            "Content-Type":"application/json"
        ]
        
        // 요청 바디
        let body: Parameters = [
            "email": email,
            "password":password
        ]
        
        // 원하는 형식의 HTTP Request 생성
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
      
    
        dataRequest.responseData { (response) in
            switch response.result {
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
