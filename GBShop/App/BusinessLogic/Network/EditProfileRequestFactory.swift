//
//  EditProfileRequestFactory.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 12.04.2021.
//

import Foundation
import Alamofire

protocol EditProfileRequestFactory {
    func editProfile(id: Int, userName: String, password: String, email: String, gender: String, creditCard: String, bio: String, completionHandler: @escaping (AFDataResponse<EditProfileResult>) -> Void)
}
