import SwiftUI

struct CoolCircleView: View {
    
    let radius: CGFloat
    var color1 = yellow
    var color2: Color = .clear
    
    var body: some View {
        Circle()
            .fill(
                LinearGradient(
                    colors: [color1,color2],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: radius, height: radius)
    }
}

#Preview {
    CoolCircleView(radius: 50)
}
