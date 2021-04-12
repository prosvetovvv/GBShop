//
//  RequestFactory.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 09.04.2021.
//

import Foundation
import Alamofire

class RequestFactory {
    
    func makeErrorParser() -> AbstractErrorParser {
        ErrorParser()
    }
    
    lazy var commonSession: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let manager = Session(configuration: configuration)
        return manager
    }()
    
    let sessionQueue = DispatchQueue.global(qos: .utility)
    
    func makeAuthRequestFactory() -> AuthRequestFactory {
        let errorParser = makeErrorParser()
        return Auth(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func makeQuitRequestFactory() -> QuitRequestFactory {
        let errorParser = makeErrorParser()
        return Quit(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
    
    func editProfile() -> EditProfileRequestFactory {
        let errorParser = makeErrorParser()
        return EditProfile(errorParser: errorParser, sessionManager: commonSession, queue: sessionQueue)
    }
}
