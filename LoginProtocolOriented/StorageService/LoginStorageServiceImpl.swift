//
//  LoginStorageServiceİmpl.swift
//  LoginProtocolOriented
//
//  Created by Onur Bulut on 5.10.2023.
//

import Foundation

class LoginStorageServiceImpl : LoginStorageService {
    let storage = UserDefaults.standard
    
    func setUserAccessToken(token: String) {
        storage.setValue(token, forKey: userAccesstokenKey)
    }
    
    func getUserAccessToken() -> String? {
        return storage.string(forKey: userAccesstokenKey)
    }
    
    var userAccesstokenKey: String{
        return "ACCESS_TOKEN"
    }

    
}
