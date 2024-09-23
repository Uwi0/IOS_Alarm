import SwiftUI

struct SelectActivityView: View {
    @Binding var currentColorIndex: Int
    @Binding var currentActivity: String
    
    private var currentColor: Color {
        mainColors[currentColorIndex]
    }
    
    private var nexIndex: Int {
        (currentColorIndex + 1) % mainColors.count
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(activities, id: \.self) { activity in
                        let isSelected = currentActivity == activity
                        Image(systemName: activity)
                            .font(isSelected ? .title2 : .subheadline)
                            .foregroundStyle(isSelected ? currentColor : nickel)
                            .opacity(isSelected ? 1.0 : 0.7)
                            .onTapGesture {
                                currentActivity = activity
                                
                            }
                    }
                }
            }
            Circle()
                .fill(currentColor)
                .frame(width: 20, height: 20)
                .shadow(color: currentColor.opacity(0.7), radius: 10, x: 0, y: 5)
                .overlay {
                    Circle()
                        .stroke(lineWidth: 1)
                }
                .onTapGesture {
                    withAnimation() {
                        currentColorIndex = nexIndex
                    }
                }
        }
        .padding(.horizontal, 5)
        .padding(.vertical, 2)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(nickel, lineWidth: 1)
        }
    }
}

#Preview {
    SelectActivityView(
        currentColorIndex: .constant(0),
        currentActivity: .constant(activities[0])
    )
}
