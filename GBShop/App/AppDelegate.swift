//
//  AppDelegate.swift
//  GBShop
//
//  Created by Vitaly Prosvetov on 06.04.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let auth = requestFactory.makeAuthRequestFactory()
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let quit = requestFactory.makeQuitRequestFactory()
        quit.logout(idUser: 123) { response in
            switch response.result {
            case .success(let quit):
                print(quit)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
        let editProfile = requestFactory.editProfile()
        editProfile.editProfile(id: 123, userName: "Somebody", password: "mypassword", email: "some@some.ru", gender: "m", creditCard: "9872389-2424-234224-234", bio: "This is good! I think I will switch to another language") { response in
            switch response.result {
            case .success(let edit):
                print(edit)
            case .failure(let error):
                print(error)
            }
        }
        
        return true
    }
}
