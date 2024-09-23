import SwiftUI

struct CircularTimeView: View {
    let currentAlarmIndex: Int?
    let size: CGFloat
    @State var alarModel: AlarmModel
    var body: some View {
        Circle()
            .stroke(lineWidth: 20)
            .frame(width: size, height: size)
            .overlay {
                Text("Circular Alarm")
            }
    }
}

#Preview {
    CircularTimeView(
        currentAlarmIndex: nil,
        size: screenWidth / 2,
        alarModel: .DefaultAlarm()
    )
}
