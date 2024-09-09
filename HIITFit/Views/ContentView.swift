//
// ContentView.swift
// This file contains the main view of the application, which presents a `TabView` with multiple tabs. It includes the `WelcomeView` and a dynamic set of `ExerciseView` based on the exercises list.

//  HIITFit
//
//  Created by Raymond Shelton on 9/1/24.
//

import SwiftUI

struct ContentView: View {
  // State variable to keep track of the selected tab index
  @State private var selectedTab = 9

  var body: some View {
    // A view that allows users to switch between different views using tabs
    TabView(selection: $selectedTab) {
      
      // The initial tab showing a welcome view
      WelcomeView(selectedTab: $selectedTab)  // 1
        .tag(9)  // 2: Tag for identifying this tab
      
      // A loop to create a view for each exercise
      ForEach(Exercise.exercises.indices, id: \.self) { index in
        ExerciseView(selectedTab: $selectedTab, index: index)
          .tag(index)  // 3: Tag for identifying this tab
      }
    }
    // Customizes the appearance of the TabView
    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
  }
}

// Preview provider to display the ContentView in Xcode previews
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

