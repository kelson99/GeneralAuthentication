//
//  SupabaseAuthClient.swift
//  GenericAuthentication
//
//  Created by Kelson Hartle on 2/10/24.
//

import Supabase

final public class SupabaseAuthClient: AuthClient {
    
    let supabase = SupabaseClient(supabaseURL: URL(string: SupabaseAPICredentials.url)!, supabaseKey: SupabaseAPICredentials.key)
    
    public init() {}

    public func signUp(credentials: AuthCredentials) async throws -> User {
        switch credentials {
        case .emailPassword(let email, let password):
            let response = try await supabase.auth.signUp(email: email, password: password)
            return response.user
        }
    }

    public func signIn(credentials: AuthCredentials) async throws -> User {
        switch credentials {
        case .emailPassword(let email, let password):
            let response = try await supabase.auth.signIn(email: email, password: password)
            return response.user
        }
    }
}
