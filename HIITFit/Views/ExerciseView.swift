//
// ExerciseView.swift
// This file defines the view for individual exercises. It displays a video player, a timer, buttons to start and mark the exercise as done, and allows rating of the exercise. It also includes a button to view the exercise history.

//  HIITFit
//
//  Created by Raymond Shelton on 9/2/24.
//

import SwiftUI

struct ExerciseView: View {
  // State variables to manage rating and visibility of modals
  @State private var rating = 0
  @State private var showHistory = false
  @State private var showSuccess = false
  
  // Binding to the selected tab index, allowing this view to modify it
  @Binding var selectedTab: Int

  // The index of the current exercise
  let index: Int

  // Computed property to get the current exercise based on the index
  var exercise: Exercise {
    Exercise.exercises[index]
  }
  
  // Computed property to check if this is the last exercise
  var lastExercise: Bool {
    index + 1 == Exercise.exercises.count
  }

  // View for the "Start Exercise" button
  var startButton: some View {
    Button("Start Exercise") {
      // Action for starting the exercise (currently empty)
    }
  }

  // View for the "Done" button
  var doneButton: some View {
    Button("Done") {
      // Toggle success view if this is the last exercise; otherwise, move to the next tab
      if lastExercise {
        showSuccess.toggle()
      } else {
        selectedTab += 1
      }
    }
  }

  // Duration for the timer display
  let interval: TimeInterval = 30
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        // Header with exercise name
        HeaderView(
          selectedTab: $selectedTab,
          titleText: Exercise.exercises[index].exerciseName)
          .padding(.bottom)

        // Video player for the current exercise
        VideoPlayerView(videoName: exercise.videoName)
          .frame(height: geometry.size.height * 0.45)

        // Timer displaying the remaining time
        Text(Date().addingTimeInterval(interval), style: .timer)
          .font(.system(size: geometry.size.height * 0.07))

        // Horizontal stack with the "Start Exercise" and "Done" buttons
        HStack(spacing: 150) {
          startButton
          doneButton
            .sheet(isPresented: $showSuccess) {
              // Success view shown when the exercise is complete
              SuccessView(selectedTab: $selectedTab)
                .presentationDetents([.medium, .large])
            }
        }
        .font(.title3)
        .padding()

        // Rating view for rating the exercise
        RatingView(rating: $rating)
          .padding()

        Spacer()

        // Button to show the history sheet
        Button("History") {
          showHistory.toggle()
        }
        .sheet(isPresented: $showHistory) {
          // History view shown when the History button is pressed
          HistoryView(showHistory: $showHistory)
        }
        .padding(.bottom)
      }
    }
  }
}

// Preview provider to display the ExerciseView in Xcode previews
struct ExerciseView_Previews: PreviewProvider {
  static var previews: some View {
    ExerciseView(selectedTab: .constant(3), index: 3)
  }
}
