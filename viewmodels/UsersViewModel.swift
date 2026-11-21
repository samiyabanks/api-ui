//
//  UsersViewModel.swift
//  usermanger
//
//  Created by samiya on 11/3/26.
//

import Foundation
import Combine   // Required for @Published and ObservableObject behavior
import SwiftUI   // Required for the environment to resolve the property wrappers cleanly

@MainActor
class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var errorMessage: String?
    
    private let api = APIClient()
    
    func fetchUsers() async {
        do {
            self.users = try await api.fetchUsers()
            self.errorMessage = nil
        } catch {
            self.errorMessage = (error as NSError).localizedDescription
        }
    }
}
