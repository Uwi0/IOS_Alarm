import SwiftUI

struct SelectActivityExpandedView: View {
    @Binding var currentColorIndex: Int
    @Binding var currentActivity: String
    var circleFrame: CGFloat = 20
    
    private var currentColor: Color {
        mainColors[currentColorIndex]
    }
    
    var body: some View {
        VStack(spacing: 35) {
            FirstColumnOfActivityIconView(
                currentActivity: currentActivity,
                currentColor: currentColor,
                circleFrame: circleFrame,
                onSelectedIndex: { i in currentColorIndex = i}
            )
            ScrollView(.horizontal, showsIndicators: false) {
                SecondColumnOfActivityIconView(
                    currentActivity: currentActivity,
                    currentColor: currentColor,
                    onSelectedActivity: { activity in currentActivity = activity}
                )
            }
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(nickel, lineWidth: 1)
                
        }
    }
}

private struct FirstColumnOfActivityIconView: View {
    
    let currentActivity: String
    let currentColor: Color
    var circleFrame: CGFloat
    var onSelectedIndex: (Int) -> Void
    
    var body: some View {
        HStack(spacing: 30) {
            ForEach(0 ..< mainColors.count,id: \.self) { i in
                let color = mainColors[i]
                let isSelectedColor = color == currentColor
                
                Circle()
                    .fill(color)
                    .frame(width: circleFrame, height: circleFrame)
                    .shadow(color: color.opacity(0.7), radius: 10, x: 0, y: 5)
                    .scaleEffect(isSelectedColor ? 1.1 : 1.0)
                    .overlay(
                        Circle()
                            .stroke(
                                lineWidth: isSelectedColor ? 3 : 0.5
                            )
                    )
                    .onTapGesture {
                        withAnimation {
                            onSelectedIndex(i)
                        }
                    }
            }
        }
    }
}

private struct SecondColumnOfActivityIconView: View {
    
    let currentActivity: String
    let currentColor: Color
    var onSelectedActivity: (String) -> Void
    
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
                            onSelectedActivity(activity)
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
        .padding(.horizontal)
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
