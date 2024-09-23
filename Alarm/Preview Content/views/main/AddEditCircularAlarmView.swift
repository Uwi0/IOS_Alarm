import SwiftUI

struct AddEditCircularAlarmView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    var body: some View {
        VStack {
            CancelSaveAlarmView(
                currentAlarmIndex: currentAlarmIndex,
                alarmModel: $alarmModel
            )
            AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)
            Divider()
            Spacer()
            CircularTimeView(
                currentAlarmIndex: currentAlarmIndex,
                size: screenWidth / 2,
                alarModel: alarmModel
            )
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AddEditCircularAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
}
