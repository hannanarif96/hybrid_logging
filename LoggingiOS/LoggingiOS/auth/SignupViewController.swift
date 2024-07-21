import UIKit

class SignupViewController: UIViewController {
    var viewModel: AuthViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = AuthViewModel()
    }

    @IBAction func signupButtonTapped(_ sender: UIButton) {
        let username = "newuser"
        let password = "newpass"
        let success = viewModel.signup(username: username, password: password)
        // Handle signup result...
        if success {
            print("Signup Successful")
        } else {
            print("Signup Failed")
        }
    }
}
