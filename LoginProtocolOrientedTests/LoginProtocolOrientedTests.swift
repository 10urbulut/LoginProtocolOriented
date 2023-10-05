//
//  LoginProtocolOrientedTests.swift
//  LoginProtocolOrientedTests
//
//  Created by Onur Bulut on 5.10.2023.
//

import XCTest
@testable import LoginProtocolOriented

final class LoginProtocolOrientedTests: XCTestCase {
    
    private var viewModel : RootViewModel!
    
    private var loginStorageService : MockLoginStorageService!
    
    private var output : MockRootViewModelOutput!
    

    override func setUpWithError() throws {
        
        loginStorageService = MockLoginStorageService()
        viewModel = RootViewModel(loginStorageService: loginStorageService)
        output = MockRootViewModelOutput()
        viewModel.output = output
        
    }

    override func tearDownWithError() throws {
        viewModel = nil
        loginStorageService = nil
        
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAccessToken() throws {
        loginStorageService.storage = [:]
        viewModel.checkLogin()
        
        
        XCTAssertEqual(output.checkArray.first, .login)
    }

    
    func testShowMainApp_whenLoginStorageReturnsEmptyString() throws {
   
        
        loginStorageService.storage["ACCESS_TOKEN"] = ""
        viewModel.checkLogin()
        
        
        XCTAssertEqual(output.checkArray.first, .login)
    }

    
    func testShowMainApp_whenLoginStorageReturnsUserAccessToken() throws {
   
        
        loginStorageService.storage["ACCESS_TOKEN"] = "123gfd234erwf"
        viewModel.checkLogin()
        
        
        XCTAssertEqual(output.checkArray.first, .mainApp)
    }


}


class MockLoginStorageService : LoginStorageService {
    var storage : [String: String] = [:]
    
    func setUserAccessToken(token: String) {
        storage[userAccesstokenKey] = token
    }
    
    func getUserAccessToken() -> String? {
        return         storage[userAccesstokenKey]
    }
    
    var userAccesstokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    
}
class MockRootViewModelOutput : RootViewModelOutput {
    
    
    enum Check {
        case login
        case mainApp
    }
    
    var checkArray : [Check] = []
    
    
    func showLogin() {
        
        checkArray.append(.login)
        
    }
    
    func showMainApp() {
        checkArray.append(.mainApp)
        
    }
    
    
    
    
}
