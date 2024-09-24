import SwiftUI

struct MainAlarmView: View {
    
    @EnvironmentObject var lnManager: LocalNotificationManager
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        TabView {
            if lnManager.isAuthorized {
                ListOfAlarmView(alarms: AlarmModel.DummyAlarmData())
                    .tabItem {
                        Label("Alarm", systemImage: "alarm.fill")
                    }
                AboutView()
                    .tabItem {
                        Label("About", systemImage: "info.circle.fill")
                    }
            }else {
                EnabledNotificationsView()
            }
            
        }
        .ignoresSafeArea()
        .task {
            try? await lnManager.requestAuthorization()
        }
        .onChange(of: scenePhase){
            if scenePhase == ScenePhase.active {
                Task {
                    await lnManager.getCurrentSettings()
                }
            }
        }
    }
}

#Preview {
    MainAlarmView()
        .environmentObject(LocalNotificationManager())
}
