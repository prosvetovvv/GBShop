//
//  LogoutRequestFactory.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 12.04.2021.
//

import Foundation
import Alamofire

protocol QuitRequestFactory {
    func logout(idUser: Int, completionHandler: @escaping (AFDataResponse<LogoutResult>) -> Void) 
}
