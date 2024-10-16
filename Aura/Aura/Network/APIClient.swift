//
//  APIClient.swift
//  Aura
//
//  Created by Bruno Evrard on 20/09/2024.
//

import Foundation

final class APIClient: APIService {
    
    
    
    private let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    var apiClientCore: APIClientCore {
        APIClientCore(session: session)
    }
    
    func authentication(user: User) async throws (APIError) -> User {
        let user: User = try await apiClientCore.fetchData(action: Action.auth, user: user).get()
        return user
    }
    
    func getAccount(user: User) async throws (APIError) -> Account {
        let account: Account = try await apiClientCore.fetchData(action: Action.account, user: user).get()
        return account
    }
    
    func transfer(user: User, transfer: Transfer) async throws (APIError) {
        let _: String = try await apiClientCore.fetchData(action: Action.transfer(transfer: transfer), user: user).get()
    }
    
}






