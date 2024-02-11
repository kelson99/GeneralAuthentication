//
//  AuthClient.swift
//  GenericAuthentication
//
//  Created by Kelson Hartle on 2/10/24.
//

import Supabase

public enum AuthCredentials {
    case emailPassword(email: String, password: String)
}

protocol AuthClient {
    func signUp(credentials: AuthCredentials) async throws -> User
}
