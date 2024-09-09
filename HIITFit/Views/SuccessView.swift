//
// SuccessView.swift
// This file defines the view shown when the user completes all exercises. It includes a congratulatory message and a button to return to the main tab.

//  HIITFit
//
//  Created by Raymond Shelton on 0/1/24.
//

import SwiftUI

struct SuccessView: View {
  // Environment variable to dismiss the current view
  @Environment(\.dismiss) var dismiss
  
  // Binding to the selected tab index, allowing this view to modify it
  @Binding var selectedTab: Int

  var body: some View {
    ZStack {
      // Main vertical stack for the success message
      VStack {
        // Image representing a raised hand (high five) with custom size and color
        Image(systemName: "hand.raised.fill")
          .resizedToFill(width: 75, height: 75)
          .foregroundColor(.purple)
        
        // Title text for the success message
        Text("High Five!")
          .font(.largeTitle)
          .fontWeight(.bold)
        
        // Body text with a congratulatory message
        Text("""
          Good job completing all four exercises!
          Remember tomorrow's another day.
          So eat well and get some rest.
          """)
        .foregroundColor(.gray)
          .multilineTextAlignment(.center)
      }
      
      // Vertical stack to position the "Continue" button at the bottom
      VStack {
        Spacer()
        Button("Continue") {
          // Set the selected tab to 9 and dismiss the view
          selectedTab = 9
          dismiss()
        }
        .padding()
      }
    }
  }
}

// Preview provider to display the SuccessView in Xcode previews
struct SuccessView_Previews: PreviewProvider {
  static var previews: some View {
    SuccessView(selectedTab: .constant(3))
  }
}
