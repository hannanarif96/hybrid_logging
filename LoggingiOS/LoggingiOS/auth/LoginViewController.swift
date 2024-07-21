import UIKit

class LoginViewController: UIViewController {
    var viewModel: AuthViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = AuthViewModel()
    }

    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = "user"
        let password = "pass"
        let success = viewModel.login(username: username, password: password)
        // Handle login result...
        if success {
            print("Login Successful")
        } else {
            print("Login Failed")
        }
    }
}
