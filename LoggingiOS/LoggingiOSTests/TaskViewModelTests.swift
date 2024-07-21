import XCTest
@testable import LoggingiOS

class TaskViewModelTests: XCTestCase {
    var viewModel: TaskViewModel!

    override func setUp() {
        super.setUp()
        viewModel = TaskViewModel()
    }

    func testAddTask() {
        let task = Task(name: "Test Task")
        viewModel.addTask(task: task)
        let tasks = viewModel.getTasks()
        XCTAssertTrue(tasks.contains { $0.name == task.name })
    }

    func testGetTasks() {
        let task1 = Task(name: "Task 1")
        let task2 = Task(name: "Task 2")
        viewModel.addTask(task: task1)
        viewModel.addTask(task: task2)
        let tasks = viewModel.getTasks()
        XCTAssertEqual(tasks.count, 2)
        XCTAssertTrue(tasks.contains { $0.name == task1.name })
        XCTAssertTrue(tasks.contains { $0.name == task2.name })
    }
}
