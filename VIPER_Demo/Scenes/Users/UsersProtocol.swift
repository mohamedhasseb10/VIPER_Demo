//
//  UsersProtocol.swift
//  VIPER_Demo
//
//  Created by Mohamed Hasseb on 18/03/2022.
//

import Foundation

protocol UsersViewProtocol: AnyObject {
    var presenter: UsersPresenterProtocol! { get set }
    func showLoadingIndicator()
    func hideLoadingIndicator()
    func reloadData()
}

protocol UsersPresenterProtocol: AnyObject {
    var view: UsersViewProtocol? { get set }
    var interactor: UsersInteractorInputProtocol { get set }
    var router: UsersRouterProtocol { get set }
    var numberOfRows: Int { get }
    func viewDidLoad()
    func configure(cell: UsersCellView, indexPath: IndexPath)
}

protocol UsersRouterProtocol {
    
}

protocol UsersInteractorInputProtocol {
    var presenter: UsersInteractorOutputProtocol? { get set }
    func getUsers()
}

protocol UsersInteractorOutputProtocol: AnyObject {
    func usersFetchedSuccessfully(users: [User])
    func usersFetchingFailed(withError error: Error)
}

protocol UsersCellView {
    func configure(viewModel: UserViewModel)
}
