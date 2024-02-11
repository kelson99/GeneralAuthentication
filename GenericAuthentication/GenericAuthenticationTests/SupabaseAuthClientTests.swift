//
//  SupabaseAuthClientTests.swift
//  GenericAuthenticationTests
//
//  Created by Kelson Hartle on 2/11/24.
//

import GenericAuthentication
import XCTest

final class SupabaseAuthClientTests: XCTestCase {
    func test_signUpWithRegisterTestAccount_returnsCorrectUser_andUserIsAllowedToSignin() async {
        let authClient = SupabaseAuthClient()
        let expectedEmail = "pizza888@me.com"
        let credentials = AuthCredentials.emailPassword(email: expectedEmail, password: "pizza111Testing")
        do {
            let user = try await authClient.signUp(credentials: credentials)
            XCTAssertEqual(user.email!, expectedEmail)
            await signInUser()
        } catch {
            XCTFail("Expected no failures \(error)")
        }
    }

    private func signInUser() async {
        let authClient = SupabaseAuthClient()
        let expectedEmail = "pizza888@me.com"
        let credentials = AuthCredentials.emailPassword(email: expectedEmail, password: "pizza111Testing")
        do {
            let user = try await authClient.signIn(credentials: credentials)
            XCTAssertEqual(user.email!, expectedEmail)
        } catch {
            XCTFail("Expected no failures \(error)")
        }
    }
}
