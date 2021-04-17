//
//  ChapterDetailView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 18/4/21.
//

import SwiftUI
import AVKit

struct ChapterDetailView: View {
    let chapter: Chapter
    var body: some View {
        Text("Chapter of \(chapter.title)")
        //LocalVideoPlayerView(videoString: chapter.video)
    }
}

struct ChapterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterDetailView(chapter: chapters[0])
    }
}
