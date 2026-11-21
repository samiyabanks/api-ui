//
//  UsersListView.swift
//  usermanger
//
//  Created by samiya on 11/3/26.
//

import Foundation
import SwiftUI

struct UsersListView: View {
    @StateObject private var viewModel = UsersViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(viewModel.users) { user in
             
                VStack(alignment: .leading, spacing: 5) {
                    Text(user.name)
                        .font(.headline)
                    
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
        }
            .navigationTitle("Users")
            .task {
                await viewModel.fetchUsers()
            }
        }
    }
}
