//
//  GenericResponse.swift
//  SOPT27_week6_assignment
//
//  Created by 이원석 on 2020/11/26.
//

import Foundation

// Codable이라는 프로토콜을 사용하여 데이터를 JSON 데이터 포맷으로 자유롭게 Decoding, Encoding 할 수 있도록 해줌
// T는 타입을 확정적으로 정해주지 않구 Response에 따라 들어오는 타입에 따라 자유롭게 변형됨을 뜻함
struct GenericResponse<T: Codable>: Codable {
    var status: Int
    var success: Bool
    var message: String
    var data: T? // data를 통해 들어올 타입 지정
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case success = "success"
        case message = "message"
        case data = "data"
    }
    
    // Json데이터의 키 값의 네이밍이 동일해야 함!
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = (try? values.decode(Int.self, forKey: .status)) ?? -1
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(T.self, forKey: .data)) ?? nil
    }
    
}
