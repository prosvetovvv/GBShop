//
//  EditProfile.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 12.04.2021.
//

import Foundation
import Alamofire

class EditProfile: AbstractRequestFactory {
    var errorParser: AbstractErrorParser
    var sessionManager: Session
    var queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: AbstractErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension EditProfile: EditProfileRequestFactory {
    func editProfile(id: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<EditProfileResult>) -> Void) {
        let requestModel = Edit(baseUrl: baseUrl, id: id, userName: userName, password: password, email: email, gender: gender, creditCard: creditCard, bio: bio)
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension EditProfile {
    struct Edit: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        var path: String = ""
        
        let id: Int
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            ["id_user": id,
             "username": userName,
             "password": password,
             "email": email,
             "gender": gender,
             "credit_card": creditCard,
             "bio": bio
            ]
        }
    
    }
}


