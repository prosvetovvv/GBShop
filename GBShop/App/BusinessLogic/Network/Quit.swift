//
//  Logout.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 12.04.2021.
//

import Foundation
import Alamofire

class Quit: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(errorParser: AbstractErrorParser,
         sessionManager: Session,
         queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension Quit: QuitRequestFactory {
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) {
        let requestModel = Logout(baseUrl: baseUrl, idUser: idUser)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension Quit {
    struct Logout: RequestRouter {
        var baseUrl: URL
        var method: HTTPMethod = .get
        var path: String = "logout.json"
        
        let idUser: Int
        var parameters: Parameters? {
            ["id_user": idUser]
        }
        
    }
}
