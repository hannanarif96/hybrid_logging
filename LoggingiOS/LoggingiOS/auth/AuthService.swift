import Foundation

class AuthService {
    private var users: [String: String] = ["user": "pass"]

    func login(username: String, password: String) -> Bool {
        return users[username] == password
    }

    func signup(username: String, password: String) -> Bool {
        guard users[username] == nil else {
            return false
        }
        users[username] = password
        return true
    }
}
