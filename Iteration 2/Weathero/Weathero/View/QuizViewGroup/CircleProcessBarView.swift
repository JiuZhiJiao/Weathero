//
//  CircleProcessBarView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 18/4/21.
//

import SwiftUI

struct CircleProcessBarView: View {
    @Binding var progress: Float
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 7)
                .opacity(0.3)
                .foregroundColor(.gray)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
                .foregroundColor(.green)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            
            Text(String(format: "%.0f%", min(self.progress, 1.0) * 100.0))
                .font(.subheadline)
        }
    }
}

#if DEBUG
struct CircleProcessBarView_Previews: PreviewProvider {
    static var previews: some View {
        CircleProcessBarView(progress: .constant(0.25))
    }
}
#endif
