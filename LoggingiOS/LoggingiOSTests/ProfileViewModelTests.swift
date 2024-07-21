import XCTest
@testable import LoggingiOS

class ProfileViewModelTests: XCTestCase {
    var viewModel: ProfileViewModel!

    override func setUp() {
        super.setUp()
        viewModel = ProfileViewModel()
    }

    func testUpdateProfile() {
        let user = User(name: "John Doe", email: "john.doe@example.com")
        viewModel.updateProfile(user: user)
        let updatedUser = viewModel.getProfile()
        XCTAssertEqual(updatedUser.name, user.name)
        XCTAssertEqual(updatedUser.email, user.email)
    }

    func testGetProfile() {
        let user = User(name: "John Doe", email: "john.doe@example.com")
        viewModel.updateProfile(user: user)
        let fetchedUser = viewModel.getProfile()
        XCTAssertEqual(fetchedUser.name, "John Doe")
        XCTAssertEqual(fetchedUser.email, "john.doe@example.com")
    }
}
