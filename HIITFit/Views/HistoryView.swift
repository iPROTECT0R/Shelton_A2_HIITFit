//
// HistoryView.swift
// This file defines the view that displays the exercise history. It shows a list of exercise days with exercises performed on each day and includes a button to close the history view.

//  HIITFit
//
//  Created by Raymond Shelton on 9/2/24.
//

import SwiftUI

struct HistoryView: View {
  // Instance of HistoryStore to provide historical data
  let history = HistoryStore()
  
  // Binding to control the visibility of this view
  @Binding var showHistory: Bool

  var body: some View {
    ZStack(alignment: .topTrailing) {
      // Button to close the history view
      Button(action: { showHistory.toggle() }) {
        Image(systemName: "xmark.circle")
      }
      .font(.title)
      .padding()

      // Vertical stack for the history content
      VStack {
        // Title for the history view
        Text("History")
          .font(.title)
          .padding()
        
        // Form to display historical data
        Form {
          // Iterate over each day in the history
          ForEach(history.exerciseDays) { day in
            Section(
              header:
                // Display the date for each section
                Text(day.date.formatted(as: "MMM d"))
                .font(.headline)) {
              // Iterate over each exercise for the given day
              ForEach(day.exercises, id: \.self) { exercise in
                // Display each exercise as a text item
                Text(exercise)
              }
            }
          }
        }
      }
    }
  }
}

// Preview provider to display the HistoryView in Xcode previews
struct HistoryView_Previews: PreviewProvider {
  static var previews: some View {
    HistoryView(showHistory: .constant(true))
  }
}
