import SwiftUI

@main
struct AlarmApp: App {
    @StateObject var lnManager: LocalNotificationManager = LocalNotificationManager()
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(lnManager)
        }
    }
}
