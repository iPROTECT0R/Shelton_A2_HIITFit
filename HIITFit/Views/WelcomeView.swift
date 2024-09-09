//
// WelcomeView.swift
// This file defines the view presented to the user when they first open the app. It includes a welcome message, a button to view history, and an image along with a "Get Started" button that navigates to the first exercise.

//  HIITFit
//
//  Created by Raymond Shelton on 9/1/24.
//

import SwiftUI

struct WelcomeView: View {
  // State variable to control the display of the history sheet
  @State private var showHistory = false
  
  // Binding to the selected tab index, allowing this view to modify it
  @Binding var selectedTab: Int

  var body: some View {
    ZStack {
      // The main vertical stack of the view
      VStack {
        // Header view with a title and the ability to change the selected tab
        HeaderView(selectedTab: $selectedTab, titleText: "Welcome")
        
        Spacer()
        
        // Button to toggle the display of the history sheet
        Button("History") {
          showHistory.toggle()
        }
        // Presents the HistoryView as a sheet when `showHistory` is true
        .sheet(isPresented: $showHistory) {
          HistoryView(showHistory: $showHistory)
        }
        .padding(.bottom)
      }

      // Overlay containing content and a button
      VStack {
        // HStack to layout text and image horizontally
        HStack(alignment: .bottom) {
          VStack(alignment: .leading) {
            Text("Get fit")
              .font(.largeTitle)
            Text("with high intensity interval training")
              .font(.headline)
          }
          // Image with custom resizing and clipping
          Image("step-up")
            .resizedToFill(width: 240, height: 240)
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 240.0, height: 240.0)
            .clipShape(Circle())
        }

        // Button to change the selected tab to 0 and start
        Button(action: { selectedTab = 0 }) {
          Text("Get Started")
          Image(systemName: "arrow.right.circle")
        }
        .font(.title2)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 20)
          .stroke(Color.gray, lineWidth: 2)
        )
      }
    }
  }
}

// Preview provider to display the WelcomeView in Xcode previews
struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView(selectedTab: .constant(9))
  }
}
