//
//  DateExtension.swift
// This file extends the `Date` type with utility functions for formatting dates. It provides methods to format dates as strings, check if two dates are on the same day, and get the name of the day of the week.

//  HIITFit
//
//  Created by Raymond Shelton on 9/1/24.
//

import Foundation

extension Date {
  /// Format a date using the specified format.
  ///   - parameters:
  ///     - format: A date pattern string like "MM dd".
  func formatted(as format: String) -> String {
    let dateFormatter = DateFormatter()  // Create a DateFormatter instance
    dateFormatter.dateFormat = format    // Set the desired date format
    return dateFormatter.string(from: self)  // Convert the date to a string using the format
  }

  // Computed property to get the date formatted as "yyyy MM dd"
  var yearMonthDay: String {
    let dateFormatter = DateFormatter()  // Create a DateFormatter instance
    dateFormatter.dateFormat = "yyyy MM dd"  // Set the date format to "yyyy MM dd"
    return dateFormatter.string(from: self)  // Convert the date to a string using the format
  }

  /// Check if another date is the same year, month, and day.
  ///   - parameters:
  ///     - day: The other date to compare.
  func isSameDay(as day: Date) -> Bool {
    return self.yearMonthDay == day.yearMonthDay  // Compare the year, month, and day parts
  }

  // Computed property to get the full name of the day of the week
  var dayName: String {
    let dateFormatter = DateFormatter()  // Create a DateFormatter instance
    dateFormatter.dateFormat = "EEEE"  // Set the date format to full day name (e.g., "Monday")
    return dateFormatter.string(from: self)  // Convert the date to a string with the day name
  }
}
