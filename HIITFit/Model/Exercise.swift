//
// Exercise.swift
// This file defines the `Exercise` struct representing an exercise with a name and video file name. It also includes an enum for exercise types and a static list of predefined exercises.

//  HIITFit
//
//  Created by Raymond Shelton on 9/2/24.
//

import Foundation

// Struct representing an exercise
struct Exercise {
  let exerciseName: String  // Name of the exercise
  let videoName: String     // Name of the video file associated with the exercise

  // Enum for defining known exercises with their names
  enum ExerciseEnum: String {
    case squat = "Squat"
    case stepUp = "Step Up"
    case burpee = "Burpee"
    case sunSalute = "Sun Salute"
  }
}

// Extension to provide a static list of exercises
extension Exercise {
  // Array of predefined exercises with their names and video files
  static let exercises = [
    Exercise(
      exerciseName: ExerciseEnum.squat.rawValue,  // Exercise name from the enum
      videoName: "squat"),                        // Associated video file name
    Exercise(
      exerciseName: ExerciseEnum.stepUp.rawValue,  // Exercise name from the enum
      videoName: "step-up"),                      // Associated video file name
    Exercise(
      exerciseName: ExerciseEnum.burpee.rawValue,  // Exercise name from the enum
      videoName: "burpee"),                       // Associated video file name
    Exercise(
      exerciseName: ExerciseEnum.sunSalute.rawValue,  // Exercise name from the enum
      videoName: "sun-salute")                      // Associated video file name
  ]
}
