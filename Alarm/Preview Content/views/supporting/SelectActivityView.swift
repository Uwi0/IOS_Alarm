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
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
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
    }
}

#Preview {
    SelectActivityView(
        currentColorIndex: .constant(0),
        currentActivity: .constant(activities[0])
    )
}
