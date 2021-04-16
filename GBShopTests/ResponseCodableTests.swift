//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by Vitaly Prosvetov on 14.04.2021.
//

import XCTest
import Alamofire

@testable import GBShop

class ResponseCodableTests: XCTestCase {
    var errorParserStub: ErrorParserStub?
    
    override func setUpWithError() throws {
        errorParserStub = ErrorParserStub()
    }
    
    override func tearDownWithError() throws {
        errorParserStub = nil
    }
    
    func testShouldDownloadAndParse() throws {
        //let download = XCTestExpectation(description: "Download https://failUrl")
        let download = expectation(description: "Download https://failUrl")
        let errorParser = try XCTUnwrap(errorParserStub)
        
        AF
            .request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json")
            .responseCodable(errorParser: errorParser) { (response: AFDataResponse<LoginResult>) in
                switch response.result {
                case .success(_):
                    download.fulfill()
                case .failure(let error):
                    XCTFail(error.localizedDescription)
                }
            }
        waitForExpectations(timeout: 5.0)
    }
    
    
    
    
    
}
