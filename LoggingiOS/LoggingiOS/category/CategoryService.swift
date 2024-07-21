import Foundation

class CategoryService {
    private var categories: [Category] = []

    func addCategory(category: Category) {
        categories.append(category)
    }

    func getCategories() -> [Category] {
        return categories
    }
}
