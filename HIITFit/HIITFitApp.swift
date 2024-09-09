//
// HIITFitApp.swift
// This file defines the main entry point of the SwiftUI application. It sets up the main app structure and specifies that `ContentView` is the root view of the application.

//  HIITFit
//
//  Created by Raymond Shelton on 9/1/24.
//

import SwiftUI

// The entry point of the SwiftUI application
@main
struct HIITFitApp: App {
  
  // Defines the body of the application, which describes the scene
  var body: some Scene {
    
    // The main window of the app that displays the content
    WindowGroup {
      
      // The initial view of the app
      ContentView()
    }
  }
}

