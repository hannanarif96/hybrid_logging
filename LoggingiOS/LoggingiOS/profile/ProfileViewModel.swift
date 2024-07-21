import Foundation

class ProfileViewModel {
    private let service = ProfileService()

    func updateProfile(user: User) {
        service.updateProfile(user: user)
    }

    func getProfile() -> User {
        return service.getProfile()
    }
}
