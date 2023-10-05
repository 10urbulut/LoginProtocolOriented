//
//  LoginStorageService.swift
//  LoginProtocolOriented
//
//  Created by Onur Bulut on 5.10.2023.
//

import Foundation
protocol LoginStorageService {
    func setUserAccessToken(token:String)
    func getUserAccessToken() -> String?
    
    var userAccesstokenKey : String{get}
}
