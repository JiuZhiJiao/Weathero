//
//  TestProcessBarView.swift
//  Weathero
//
//  Created by JiuZhiJiao on 2/5/21.
//

import SwiftUI

struct TestProcessBarView: View {
    @Binding var correctNumber: Int
    let width: CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
//            Circle()
//                .stroke(lineWidth: 7)
//                .opacity(0.3)
//                .foregroundColor(.gray)
//
//            Circle()
//                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
//                .stroke(style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
//                .foregroundColor(.green)
//                .rotationEffect(Angle(degrees: 270.0))
//                .animation(.linear)
//
//            Text(String(format: "%.0f%", min(self.progress, 1.0) * 100.0))
//                .font(.subheadline)
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: width, height: 20)
                .opacity(0.3)
                .foregroundColor(.gray)
            
            RoundedRectangle(cornerRadius: 30)
                .frame(width: width * CGFloat(Float(correctNumber)/2.0), height: 20)
                .foregroundColor(.green)
                .animation(.linear)
        }
    }
}

struct TestProcessBarView_Previews: PreviewProvider {
    static var previews: some View {
        TestProcessBarView(correctNumber: .constant(9), width: 300)
    }
}
