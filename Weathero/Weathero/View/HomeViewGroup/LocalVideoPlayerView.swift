//
//  LocalVideoPlayer.swift
//  Weathero
//
//  Created by JiuZhiJiao on 16/4/21.
//

import SwiftUI
import AVKit

struct LocalVideoPlayerView: UIViewControllerRepresentable {
    
    let videoString: String
    let controller : AVPlayerViewController
    
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let bundle_url = Bundle.main.path(forResource: videoString, ofType: "mp4")
        let video_url = URL(fileURLWithPath: bundle_url!)
        let player = AVPlayer(url: video_url)
        
        controller.player = player
        
        controller.showsPlaybackControls = true
        controller.player?.isMuted = false
        //controller.player?.play()
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}
