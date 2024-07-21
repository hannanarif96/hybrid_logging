import Foundation

class CategoryViewModel {
    private let service = CategoryService()

    func addCategory(category: Category) {
        service.addCategory(category: category)
    }

    func getCategories() -> [Category] {
        return service.getCategories()
    }
}
