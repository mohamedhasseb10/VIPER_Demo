//
//  UsersPresenter.swift
//  VIPER_Demo
//
//  Created by Mohamed Hasseb on 18/03/2022.
//

import Foundation

class UsersPresenter: UsersPresenterProtocol, UsersInteractorOutputProtocol {
    
    weak var view: UsersViewProtocol?
    var interactor: UsersInteractorInputProtocol
    var router: UsersRouterProtocol
    private var users = [User]()
    
    var numberOfRows: Int {
        return users.count
    }
    
    init(view: UsersViewProtocol, interactor: UsersInteractorInputProtocol, router: UsersRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        view?.showLoadingIndicator()
        interactor.getUsers()
    }
    
    func usersFetchedSuccessfully(users: [User]) {
        view?.hideLoadingIndicator()
        self.users.append(contentsOf: users)
        view?.reloadData()
    }
    
    func usersFetchingFailed(withError error: Error) {
        view?.hideLoadingIndicator()
        //Failure - Should show alert
    }
    
    func configure(cell: UsersCellView, indexPath: IndexPath) {
        let user = users[indexPath.row]
        let viewModel = UserViewModel(user: user)
        cell.configure(viewModel: viewModel)
    }
}
