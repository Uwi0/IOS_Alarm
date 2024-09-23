import SwiftUI

struct TimeArcView: View {
    
    let percentDifference: CGFloat
    let srtokeStyle: StrokeStyle
    let size: CGFloat
    let rotateCircleOffset: CGFloat
    let color: Color
    
    var body: some View {
        Circle()
            .trim(from: 0, to: percentDifference)
            .stroke(style: srtokeStyle)
            .foregroundStyle(color)
            .frame(width: size, height: size)
            .rotationEffect(.degrees(-90))
            .rotationEffect(.degrees(rotateCircleOffset))
            
    }
}

#Preview {
    TimeArcView(
        percentDifference: 0.5,
        srtokeStyle: StrokeStyle(lineWidth: 15, dash: [1, 2]),
        size: 200,
        rotateCircleOffset: 30,
        color: black
    )
}
