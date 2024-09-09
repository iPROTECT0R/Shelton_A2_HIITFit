//
// HeaderView.swift
// This file defines the `HeaderView` struct, which displays a header with a title and a row of icons representing different exercise steps. The icons are interactive and allow users to navigate between different exercise steps by updating the selected tab.

//  HIITFit
//
//  Created by Raymond Shelton on 9/1/24.
//

import SwiftUI

struct HeaderView: View {
  @Binding var selectedTab: Int  // 1: Binding to the selected tab index, allowing this view to modify it
  let titleText: String  // The title text displayed in the header

  var body: some View {
    VStack {
      // Title text displayed at the top of the header
      Text(titleText)
        .font(.largeTitle)
      
      HStack {  // 2: Horizontal stack to arrange tab indicators
        // Loop through indices of exercises to create tab indicators
        ForEach(Exercise.exercises.indices, id: \.self) { index in  // 3
          // Determine the fill style for the current tab indicator
          let fill = index == selectedTab ? ".fill" : ""
          // Create a circular tab indicator with optional fill style
          Image(systemName: "\(index + 1).circle\(fill)")  // 4
            .onTapGesture {
              // Update the selected tab when the indicator is tapped
              selectedTab = index
            }
        }
      }
      .font(.title2)  // Set the font size of the tab indicators
    }
  }
}

// Preview provider to display the HeaderView in Xcode previews
struct HeaderView_Previews: PreviewProvider {
  static var previews: some View {
    HeaderView(selectedTab: .constant(0), titleText: "Squat")  // Preview with default selected tab and title
      .previewLayout(.sizeThatFits)  // Adjust the preview layout to fit the content size
  }
}
