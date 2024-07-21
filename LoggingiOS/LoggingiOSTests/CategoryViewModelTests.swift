import XCTest
@testable import LoggingiOS

class CategoryViewModelTests: XCTestCase {
    var viewModel: CategoryViewModel!

    override func setUp() {
        super.setUp()
        viewModel = CategoryViewModel()
    }

    func testAddCategory() {
        let category = Category(name: "Work")
        viewModel.addCategory(category: category)
        let categories = viewModel.getCategories()
        XCTAssertTrue(categories.contains { $0.name == category.name })
    }

    func testGetCategories() {
        let category1 = Category(name: "Work")
        let category2 = Category(name: "Personal")
        viewModel.addCategory(category: category1)
        viewModel.addCategory(category: category2)
        let categories = viewModel.getCategories()
        XCTAssertEqual(categories.count, 2)
        XCTAssertTrue(categories.contains { $0.name == category1.name })
        XCTAssertTrue(categories.contains { $0.name == category2.name })
    }
}
