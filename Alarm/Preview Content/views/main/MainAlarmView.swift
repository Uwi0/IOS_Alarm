import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        TabView {
            ListOfAlarmView(alarms: AlarmModel.DummyAlarmData())
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
