//
//  UsersInteractor.swift
//  VIPER_Demo
//
//  Created by Mohamed Hasseb on 18/03/2022.
//

import Foundation

class UsersInteractor: UsersInteractorInputProtocol {
    
    weak var presenter: UsersInteractorOutputProtocol?
    
    private let usersWorker = UsersWorker()
    
    func getUsers() {
        usersWorker.getUsers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.presenter?.usersFetchedSuccessfully(users: users)
            case .failure(let error):
                self.presenter?.usersFetchingFailed(withError: error)
            }
        }
    }
    
}
