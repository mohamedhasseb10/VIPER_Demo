//
//  UserWorker.swift
//  VIPER_Demo
//
//  Created by Mohamed Hasseb on 18/03/2022.
//

import Foundation

class UsersWorker {
    
    private let networkLayer = NetworkLayer()
    
    func getUsers(completionHandler: @escaping (Result<[User]>) -> ()) {
        networkLayer.request(UserRouter.get, decodeToType: [User].self, completionHandler: completionHandler)
    }
    
}
