//
//  miSafetyApp.swift
//  miSafety
//
//  Created by Michael Tayamen Satumba Jr. on 1/27/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main

struct miSafetyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
          NavigationView {
            ContentView()
          }
        }
      }
    }
