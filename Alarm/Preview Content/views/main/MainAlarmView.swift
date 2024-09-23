import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        TabView {
            AddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
                .tabItem {
                    Label("Alarm", systemImage: "alarm.fill")
                }
            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle.fill")
                }
        }
    }
}

#Preview {
    MainAlarmView()
}
