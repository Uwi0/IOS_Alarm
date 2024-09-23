import SwiftUI

struct SelectActivityExpandedView: View {
    @Binding var currentColorIndex: Int
    @Binding var currentActivity: String
    
    var circleFrame: CGFloat = 20
    
    private var currentColor: Color {
        mainColors[currentColorIndex]
    }
    var body: some View {
        HStack(spacing: 30) {
            ForEach(0 ..< mainColors.count, id:\.self) { i in
                let color = mainColors[i]
                let isSelected = color == currentColor
                
                Circle()
                    .fill(color)
                    .frame(width: circleFrame, height: circleFrame)
                    .shadow(color: color.opacity(0.7), radius: 10, x: 0, y: 5)
                    .scaleEffect(isSelected ? 1.1 : 1)
                    .overlay {
                        Circle()
                            .stroke(lineWidth: isSelected ? 3 : 0.5)
                    }
                    .onTapGesture {
                        withAnimation {
                            currentColorIndex = i
                        }
                    }
            }
        }
    }
}

#Preview {
    SelectActivityExpandedView(
        currentColorIndex: .constant(0),
        currentActivity: .constant(activities[0])
    )
}
