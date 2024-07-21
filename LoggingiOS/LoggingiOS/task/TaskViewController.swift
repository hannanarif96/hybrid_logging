import UIKit

class TaskViewController: UIViewController {
    var viewModel: TaskViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = TaskViewModel()
    }

    @IBAction func addTaskButtonTapped(_ sender: UIButton) {
        let taskName = "Test Task"
        viewModel.addTask(task: Task(name: taskName))
        print("Task Added")
    }
}
