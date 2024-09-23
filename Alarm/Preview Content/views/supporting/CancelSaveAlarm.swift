import SwiftUI

struct CancelSaveAlarm: View {
    let currentAlarmIndex: Int?
    @Binding var alarmModel: AlarmModel
    

    var body: some View {
        HStack {
            Button(
                action: {
                    
                },
                label: {
                    Text("Cancel")
                }
            )
            Spacer()
            Button(
                action: {
                    if let currentAlarmIndex {
                        //TODO: edit alarm to view model
                    } else {
                        //TODO: Append alarm to view model
                    }
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
    CancelSaveAlarm(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()))
}
