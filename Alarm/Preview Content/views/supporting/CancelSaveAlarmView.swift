import SwiftUI

struct CancelSaveAlarmView: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    @EnvironmentObject var lnManager: LocalNotificationManager
    @Environment(\.presentationMode) var presentation

    var body: some View {
        HStack {
            Button(
                action: {
                    print("cancel create alarm")
                    self.presentation.wrappedValue.dismiss()
                },
                label: {
                    Text("Cancel")
                }
            )
            Spacer()
            Button(
                action: {
                    print("save alarm")
                    if let currentAlarmIndex {
                        lnManager.alarmModels[currentAlarmIndex] = alarmModel
                    } else {
                        lnManager.safeAppend(localNotification: alarmModel)
                    }
                    self.presentation.wrappedValue.dismiss()
                },
                label: {
                    Text("Save")
                }
            )
        }
        .padding()
    }
}

#Preview {
    CancelSaveAlarmView(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()))
        .environmentObject(LocalNotificationManager())
}
