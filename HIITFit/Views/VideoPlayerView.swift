//
// VideoPlayerView.swift
// This file defines a view that displays a video player for playing exercise videos. It loads a video from the app bundle based on the provided video name.

//  HIITFit
//
//  Created by Raymond Shelton on 9/1/24.
//


import SwiftUI
import AVKit

struct VideoPlayerView: View {
  // Name of the video file to play
  let videoName: String

  var body: some View {
    // Attempt to find the video file in the main bundle
    if let url = Bundle.main.url(
      forResource: videoName,
      withExtension: "mp4") {
      // Create and display a VideoPlayer with the video URL
      VideoPlayer(player: AVPlayer(url: url))
    } else {
      // Display an error message if the video file is not found
      Text("Couldn’t find \(videoName).mp4")
        .foregroundColor(.red)
    }
  }
}

// Preview provider to display the VideoPlayerView in Xcode previews
struct VideoPlayerView_Previews: PreviewProvider {
  static var previews: some View {
    VideoPlayerView(videoName: "squat")
  }
}
