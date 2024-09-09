//
// ImageExtension.swift
// This file extends the `Image` type with a method to resize images with a fill aspect ratio. It ensures that the image scales to fit within specified dimensions while maintaining its aspect ratio.

//  HIITFit
//
//  Created by Raymond Shelton on 9/1/24.
//

import SwiftUI

extension Image {
  /// Resize an image with a fill aspect ratio and specified frame dimensions.
  ///   - parameters:
  ///     - width: Frame width.
  ///     - height: Frame height.
  func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
    self
      .resizable()  // Allow the image to be resized
      .aspectRatio(contentMode: .fill)  // Scale the image to fill the frame while maintaining its aspect ratio
      .frame(width: width, height: height)  // Set the frame size of the image
  }
}

