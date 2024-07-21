import Foundation

class TaskService {
    private var tasks: [Task] = []

    func addTask(task: Task) {
        tasks.append(task)
    }

    func getTasks() -> [Task] {
        return tasks
    }
}
