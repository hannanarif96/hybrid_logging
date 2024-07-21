import UIKit

class CategoryViewController: UIViewController {
    var viewModel: CategoryViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = CategoryViewModel()
    }

    @IBAction func addCategoryButtonTapped(_ sender: UIButton) {
        let categoryName = "Work"
        viewModel.addCategory(category: Category(name: categoryName))
        print("Category Added")
    }
}
