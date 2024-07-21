import UIKit
import Flutter

class MyFlutterViewController: FlutterViewController {
    private let channelName = "com.example.settings"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let engine = engine else {
            return
        }
        
        let methodChannel = FlutterMethodChannel(name: channelName, binaryMessenger: engine.binaryMessenger)
        methodChannel.setMethodCallHandler { [weak self] call, result in
            guard call.method == "getDarkMode" || call.method == "setDarkMode" else {
                result(FlutterMethodNotImplemented)
                return
            }

            switch call.method {
            case "getDarkMode":
                let darkMode = self?.getDarkModePreference() ?? false
                print("getDarkMode Triggered")
                result(darkMode)
            case "setDarkMode":
                if let darkMode = call.arguments as? Bool {
                    self?.setDarkModePreference(darkMode)
                    result(nil)
                } else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "Expected a boolean value", details: nil))
                }
            default:
                result(FlutterMethodNotImplemented)
            }
        }
        
    }

    private func getDarkModePreference() -> Bool {
        let userDefaults = UserDefaults.standard
        return userDefaults.bool(forKey: "dark_mode") ??
        (traitCollection.userInterfaceStyle == .dark)
    }

    private func setDarkModePreference(_ darkMode: Bool) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(darkMode, forKey: "dark_mode")
                
        if darkMode {
            overrideUserInterfaceStyle = .dark
        } else {
            overrideUserInterfaceStyle = .light
        }
    }
}
