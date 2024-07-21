import XCTest
@testable import LoggingiOS

class AuthViewModelTests: XCTestCase {
    var viewModel: AuthViewModel!

    override func setUp() {
        super.setUp()
        viewModel = AuthViewModel()
    }

    func testLoginSuccess() {
        let result = viewModel.login(username: "user", password: "pass")
        XCTAssertTrue(result)
    }

    func testLoginFailure() {
        let result = viewModel.login(username: "user", password: "wrongpass")
        XCTAssertFalse(result)
    }

    func testSignupSuccess() {
        let result = viewModel.signup(username: "newuser", password: "newpass")
        XCTAssertTrue(result)
    }

    func testSignupFailure() {
        viewModel.signup(username: "user", password: "pass") // Existing user
        let result = viewModel.signup(username: "user", password: "pass")
        XCTAssertFalse(result)
    }
}
