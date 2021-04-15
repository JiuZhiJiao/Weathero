//
//  LoopVideoPlayer.swift
//  Weathero
//
//  Created by JiuZhiJiao on 15/4/21.
//

import SwiftUI
import AVFoundation

struct LoopVideoPlayerView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        return LoopPlayerUIView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

class LoopPlayerUIView: UIView {
    private var playerLayer = AVPlayerLayer()
    private var playerLooper: AVPlayerLooper?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // load video
        let bundle_url = Bundle.main.path(forResource: "HomeHero", ofType: "MP4")
        let video_url = URL(fileURLWithPath: bundle_url!)
        let playerItem = AVPlayerItem(url: video_url)
        
        // setup player
        let player = AVQueuePlayer(playerItem: playerItem)
        player.isMuted = true
        playerLayer.player = player
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        // loop
        playerLooper = AVPlayerLooper(player: player, templateItem: playerItem)
        
        // play
        player.play()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#if DEBUG
struct LoopVideoPlayer_PreviewsView: PreviewProvider {
    static var previews: some View {
        LoopVideoPlayerView()
    }
}
#endif
