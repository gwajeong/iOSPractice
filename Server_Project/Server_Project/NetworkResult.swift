//
//  NetworkResult.swift
//  Server_Project
//
//  Created by soyounglee on 2020/11/11.
//

import Foundation


enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
