import SwiftUI

struct CircularTimeView: View {
    let currentAlarmIndex: Int?
    let size: CGFloat
    @Binding var alarmModel: AlarmModel
    
    private var startTime: Date {
        alarmModel.start
    }
    private var endTime: Date {
        alarmModel.end
    }
    private var percentDifference: CGFloat {
        let startPercent = dateToPercent(date: startTime)
        let endPercent = dateToPercent(date: endTime)
        let value = endPercent - startPercent
        return value >= 0 ? value : 1 + value
    }
    private var startDateToPercent: CGFloat {
        dateToPercent(date: startTime)
    }
    private var endDateToPercent: CGFloat {
        startDateToPercent + percentDifference
    }
    private var rotateCircleOffset: CGFloat {
        360 * startDateToPercent
    }
    
    var body: some View {
        ZStack {
            CentralDatePickerView(size: size, alarmModel: $alarmModel)
            TimeArcView(
                percentDifference: percentDifference,
                srtokeStyle: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round),
                size: size,
                rotateCircleOffset: rotateCircleOffset,
                color: .black
            )
            TimeArcView(
                percentDifference: percentDifference,
                srtokeStyle: StrokeStyle(lineWidth: 15, dash: [1, 2]),
                size: size,
                rotateCircleOffset: rotateCircleOffset,
                color: .gray
            )
            DisplayIconCircularTimeView(
                time: startTime,
                size: size,
                percent: startDateToPercent
            )
            DisplayIconCircularTimeView(
                time: endTime,
                size: size,
                percent: endDateToPercent
            )
        }
    }
}

#Preview {
    CircularTimeView(
        currentAlarmIndex: nil,
        size: screenWidth / 2,
        alarmModel: .constant(.DefaultAlarm())
    )
}
