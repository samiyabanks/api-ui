//
//  APIClient.swift
//  usermanger
//
//  Created by samiya on 11/3/26.
//

import Foundation

struct APIClient {

    let baseURL = URL(string: "http://127.0.0.1:8080")!

    func fetchUsers() async throws -> [User] {

        let url = baseURL.appending(path: "users")

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let users = try JSONDecoder().decode([User].self, from: data)

        return users
    }
}
