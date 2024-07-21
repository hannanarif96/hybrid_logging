//
//  AppDelegate.swift
//  LoggingiOS
//
//  Created by Hannan on 8/7/24.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@UIApplicationMain
class AppDelegate: FlutterAppDelegate {
    lazy var flutterEngine = FlutterEngine(name: "my flutter engine")
    private let channelName = "com.example.settings"

    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        flutterEngine.run()
//        GeneratedPluginRegistrant.register(with: self.flutterEngine)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions);
      }
}

