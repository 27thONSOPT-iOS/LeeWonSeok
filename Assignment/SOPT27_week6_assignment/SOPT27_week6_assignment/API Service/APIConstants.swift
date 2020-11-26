//
//  APIConstants.swift
//  SOPT27_week6_assignment
//
//  Created by 이원석 on 2020/11/26.
//

// API주소 모아놓는 곳
import Foundation

struct APIConstants {
    
    static let baseURL = "http://15.164.83.210:3000"
    // 로그인 url
    static let usersSignInURL = baseURL + "/users/signin"
    // 회원가입 url
    static let usersSignUpURL = baseURL + "/users/signup" 
}
