import SwiftUI

struct CentralDatePickerView: View {
    
    let size: CGFloat
    @Binding var alarmModel: AlarmModel
    var lineWidth: CGFloat = 10
    
    var body: some View {
        Circle()
            .stroke(lightGray, style: StrokeStyle(lineWidth: lineWidth))
            .frame(width: size, height: size)
            .overlay {
                VStack {
                    VStack {
                        GrayedTextView(text: "Start", font: .caption)
                        TimePickerView(time: $alarmModel.start.animation(), scale: 1)
                    }
                    Spacer()
                    GrayedTextView(text: "Set the Alarm")
                    Spacer()
                    VStack {
                        TimePickerView(time: $alarmModel.end.animation(), scale: 1)
                        GrayedTextView(text: "End", font: .caption)
                    }
                }
                .padding()
                .padding(.vertical)
            }
    }
}

#Preview {
    CentralDatePickerView(size: 200, alarmModel: .constant(.DefaultAlarm()))
}
