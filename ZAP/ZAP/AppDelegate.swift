//
//  AppDelegate.swift
//  ZAP
//
//  Created by kaique.magno.santos on 07/01/20.
//  Copyright © 2020 Kaique Magno. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    /**
     # Type a script or drag a script file from your workspace to insert its path.
     Resources=$PROJECT_DIR/ZAP/Resources
     SwiftgenDir=$PROJECT_DIR/swiftgen/
     Templates=$SwiftgenDir/templates
     LocalizationInput= $Resources/Localization/en.lproj/Localizable.strings
     LocalizationOutput= $Resources/Localization/GeneratedStrings.swift

     $SwiftgenDir/bin/swiftgen strings $LocalizationInput -p $Templates/strings/structured-swift4.stencil --output $LocalizationOutput;

     */
}

