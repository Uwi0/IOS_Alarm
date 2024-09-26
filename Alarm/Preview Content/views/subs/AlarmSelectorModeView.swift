
import SwiftUI

struct AlarmSelectorModeView: View {
    @Binding var selectedAlarm: AlarmType
    @Binding var currentIndex: Int?
    @EnvironmentObject var lnManager: LocalNotificationManager
    var body: some View {
        if selectedAlarm == .standard {
            AddEditAlarmView(currentAlarmIndex: $currentIndex)
        } else {
            if let currentIndex = currentIndex {
                AddEditCircularAlarmView(
                    currentAlarmIndex: $currentIndex,
                    alarmModel: lnManager.alarmModels[currentIndex]
                )
            } else {
                AddEditCircularAlarmView(
                    currentAlarmIndex: $currentIndex,
                    alarmModel: .DefaultAlarm()
                )
            }
        }
        
    }
}

#Preview {
    AlarmSelectorModeView(
        selectedAlarm: .constant(.standard),
        currentIndex: .constant(nil)
    )
        .environmentObject(LocalNotificationManager())
}
