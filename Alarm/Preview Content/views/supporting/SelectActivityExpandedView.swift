import SwiftUI

struct SelectActivityExpandedView: View {
    @Binding var currentColorIndex: Int
    @Binding var currentActivity: String
    var circleFrame: CGFloat = 20
    
    private var currentColor: Color {
        mainColors[currentColorIndex]
    }
    
    var body: some View {
        VStack {
            FirstColumnOfActivityIconView(
                currentActivity: currentActivity,
                currentColor: currentColor,
                currentColorIndex: currentColorIndex,
                circleFrame: circleFrame
            )
            ScrollView(.horizontal, showsIndicators: false) {
                SecondColumnOfActivityIconView(
                    currentActivity: currentActivity,
                    currentColor: currentColor
                )
            }
        }
    }
}

private struct FirstColumnOfActivityIconView: View {
    
    @State var currentActivity: String
    @State var currentColor: Color
    @State var currentColorIndex: Int
    var circleFrame: CGFloat
    
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

private struct SecondColumnOfActivityIconView: View {
    
    @State var currentActivity: String
    let currentColor: Color
    
    var body: some View {
        HStack {
            ForEach(activities, id: \.self) { activity in
                let isSelected = activity == currentActivity
                let isSelectedColor = isSelected && currentColor != black
                Image(systemName: activity)
                    .font(isSelected ? .headline : .subheadline)
                    .foregroundStyle(isSelected ? currentColor : nickel)
                    .opacity(isSelected ? 1.0 : 0.7)
                    .onTapGesture {
                        withAnimation{
                            currentActivity = activity
                        }
                    }
                    .padding()
                    .background(
                        ActivityBackgroundView(
                            isSelected: isSelected,
                            isSelectedColor: isSelectedColor,
                            currentColor: currentColor
                        )
                    )
            }
        }
    }
}

private struct ActivityBackgroundView: View {
    let isSelected: Bool
    let isSelectedColor: Bool
    let currentColor: Color
    var body: some View {
        Circle()
            .fill(isSelectedColor ? black.opacity(0.9) : .clear)
            .overlay {
                Circle()
                    .stroke(
                        isSelected ? currentColor : black ,
                        lineWidth: isSelected ? 1 : 0.0
                    )
            }
    }
}

#Preview {
    SelectActivityExpandedView(
        currentColorIndex: .constant(0),
        currentActivity: .constant(activities[0])
    )
}
