//
// HistoryStore.swift
// This file defines the `ExerciseDay` struct and the `HistoryStore` struct. `ExerciseDay` represents a day with a list of exercises, while `HistoryStore` manages a collection of `ExerciseDay` instances and populates sample data in debug builds.

//  HIITFit
//
//  Created by Raymond Shelton on 9/2/24.
//

import Foundation

// Represents a day of exercises with a unique identifier
struct ExerciseDay: Identifiable {
  let id = UUID()  // Unique identifier for each ExerciseDay
  let date: Date  // Date of the exercise day
  var exercises: [String] = []  // List of exercise names for this day
}

// Stores a history of exercise days
struct HistoryStore {
  var exerciseDays: [ExerciseDay] = []  // Array to hold multiple ExerciseDay instances

  // Initialize HistoryStore and populate with development data if in DEBUG mode
  init() {
    #if DEBUG
    createDevData()  // Call function to create sample data for testing
    #endif
  }
}

