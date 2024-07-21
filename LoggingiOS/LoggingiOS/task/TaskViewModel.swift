import Foundation

class TaskViewModel {
    private let service = TaskService()

    func addTask(task: Task) {
        service.addTask(task: task)
    }

    func getTasks() -> [Task] {
        return service.getTasks()
    }
}
