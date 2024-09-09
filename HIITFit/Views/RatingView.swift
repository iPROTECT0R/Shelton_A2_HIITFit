//
// RatingView.swift
// This file defines a view that allows users to rate an exercise using a visual rating system. It uses stars or similar icons to represent the rating value and updates the rating based on user interaction.

//  HIITFit
//
//  Created by Raymond Shelton on 9/1/24.
//

import SwiftUI

struct RatingView: View {
  @Binding var rating: Int  // 1: Binding to the rating value, allowing external modifications
  
  let maximumRating = 5  // 2: Maximum rating value (number of stars)

  let onColor = Color.red  // 3: Color for active rating (selected)
  let offColor = Color.gray  // Color for inactive rating (not selected)

  var body: some View {
    HStack {
      // Loop to create rating icons for each value up to the maximum rating
      ForEach(1 ..< maximumRating + 1, id: \.self) { index in
        Image(systemName: "waveform.path.ecg")
          .foregroundColor(
            index > rating ? offColor : onColor)  // 4: Set color based on whether the rating is active
          .onTapGesture {  // 5: Update the rating when an icon is tapped
            rating = index
          }
      }
    }
    .font(.largeTitle)  // Set the font size of the icons
  }
}

// Preview provider to display the RatingView in Xcode previews
struct RatingView_Previews: PreviewProvider {
  static var previews: some View {
    RatingView(rating: .constant(3))  // Preview with a default rating value of 3
      .previewLayout(.sizeThatFits)  // Adjust the preview layout to fit the content size
  }
}
