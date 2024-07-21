import UIKit

class ProfileViewController: UIViewController {
    var viewModel: ProfileViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = ProfileViewModel()
    }

    @IBAction func updateProfileButtonTapped(_ sender: UIButton) {
        let user = User(name: "John Doe", email: "john.doe@example.com")
        viewModel.updateProfile(user: user)
        print("Profile Updated")
    }
}
