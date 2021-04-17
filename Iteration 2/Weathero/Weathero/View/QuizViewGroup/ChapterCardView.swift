//
//  ChapterCardView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 18/4/21.
//

import SwiftUI

struct ChapterCardView: View {
    @State var progress: Float = 0.3
    let chapter: Chapter
    
    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            Divider()
            Spacer()
                .frame(height: 5)
            Text("Chapter \(chapter.chapterNO)")
                .font(.subheadline)
                .foregroundColor(.blue)
            HStack {
                VStack {
                    Text(chapter.title)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                Spacer()
                CircleProcessBarView(progress: $progress)
                    .frame(width: 35, height: 35)
                Spacer()
                    .frame(width: 10)
            }
            Text(chapter.subtitle)
                .font(.title2)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
            Spacer()
            Image(chapter.image)
                .resizable()
                .scaledToFill()
                .frame(width: 350, height: 250)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.gray, lineWidth: 1))
        }
    }
}

#if DEBUG
struct ChapterCardView_Previews: PreviewProvider {
    static var previews: some View {
        ChapterCardView(chapter: chapters[0])
            .previewLayout(.fixed(width: 350, height: 400))
    }
}
#endif
