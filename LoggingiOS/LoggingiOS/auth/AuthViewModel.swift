import Foundation

class AuthViewModel {
    private let service = AuthService()

    func login(username: String, password: String) -> Bool {
        return service.login(username: username, password: password)
    }

    func signup(username: String, password: String) -> Bool {
        return service.signup(username: username, password: password)
    }
}
