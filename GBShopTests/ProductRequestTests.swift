//
//  ProductRequestTests.swift
//  GBShopTests
//
//  Created by Vitaly Prosvetov on 19.04.2021.
//

import XCTest

@testable import GBShop

class ProductRequestTests: XCTestCase {
    var requestFactory: RequestFactory!
    var productRequestFactory: ProductRequestFactory!

    override func setUpWithError() throws {
        requestFactory = RequestFactory(sessionQueue: AppConfig.sessionQueue, baseUrl: AppConfig.baseUrl)
        productRequestFactory = requestFactory.makeProductRequestFactory()
    }

    override func tearDownWithError() throws {
        requestFactory = nil
        productRequestFactory = nil
    }
    
    func testShouldGetProductList() throws {
        let requestProduct = expectation(description: "Send request to get product list")
        
        productRequestFactory.getProductList(page: 1, id: 1) { response in
            switch response.result {
            case .success(_):
                requestProduct.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5.0)
    }


}
