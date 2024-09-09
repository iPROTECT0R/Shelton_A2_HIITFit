//
//  HistoryStoreDevData.swift
// This file extends the `HistoryStore` struct to include a method for generating sample data for development purposes.
// The `createDevData` method populates the `exerciseDays` array with example data to facilitate testing and debugging.
// It creates `ExerciseDay` instances with predefined dates and exercise names.

//  HIITFit
//
//  Created by Raymond Shelton on 9/1/24.
//


import Foundation

extension HistoryStore {
  // Function to create sample data for development purposes
  mutating func createDevData() {
    // Development data
    exerciseDays = [
      ExerciseDay(
        date: Date().addingTimeInterval(-86400),  // Date for yesterday
        exercises: [
          Exercise.exercises[0].exerciseName,  // Name of the first exercise
          Exercise.exercises[1].exerciseName,  // Name of the second exercise
          Exercise.exercises[2].exerciseName   // Name of the third exercise
        ]),
      ExerciseDay(
        date: Date().addingTimeInterval(-86400 * 2),  // Date for two days ago
        exercises: [
          Exercise.exercises[1].exerciseName,  // Name of the second exercise
          Exercise.exercises[0].exerciseName   // Name of the first exercise
        ])
    ]
  }
}
