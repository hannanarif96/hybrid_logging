import Foundation

class ProfileService {
    private var user = User(name: "Default Name", email: "default@example.com")

    func updateProfile(user: User) {
        self.user = user
    }

    func getProfile() -> User {
        return user
    }
}
