import UIKit
import Flutter

class ViewController: UIViewController {
    

        @IBAction func openFlutterModule(_ sender: Any) {
            let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
                let flutterViewController =
                    MyFlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
                present(flutterViewController, animated: true, completion: nil)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let logger = Logger()
        let viewModel = MainViewModel(logger: logger)
        viewModel.logData(className: NSStringFromClass(classForCoder))
    }


}

