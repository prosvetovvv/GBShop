//
//  AccountRequestTests.swift
//  GBShopTests
//
//  Created by Vitaly Prosvetov on 19.04.2021.
//

import XCTest

@testable import GBShop

class AccountRequestTests: XCTestCase {
    var requestFactory: RequestFactory!
    var accountRequestFactory: AccountRequestFactory!
    
    override func setUpWithError() throws {
        requestFactory = RequestFactory(sessionQueue: AppConfig.sessionQueue, baseUrl: AppConfig.baseUrl)
        accountRequestFactory = requestFactory.makeAccountRequestFactory()
    }
    
    override func tearDownWithError() throws {
        requestFactory = nil
        accountRequestFactory = nil
    }
    
    func testShouldLoginUser() throws {
        let requestLogin = expectation(description: "Send request to login")
       
        accountRequestFactory.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(_):
                requestLogin.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5.0)
    }
    
    func testShouldLogout() throws {
        let requestLogout = expectation(description: "Send request to logout")
        
        accountRequestFactory.logout(idUser: 123) { response in
            switch response.result {
            case .success(_):
                requestLogout.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5.0)
    }
    
    func testShouldEditProfile() throws {
        let requestEditProfile = expectation(description: "Send request to edit profile")
        
        accountRequestFactory.editProfile(id: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(_):
                requestEditProfile.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5.0)
    }
    
}
