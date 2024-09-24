import SwiftUI

struct EnabledNotificationsView: View {
    
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    var body: some View {
        ZStack {
            FourCoolCirclesView()
            VStack {
                Spacer()
                CoolTextView(
                    text: "Enabled Notifications, please",
                    size: 48
                )
                    .multilineTextAlignment(.center)
                Spacer()
                Button(
                    action: {
                        lnManager.openSettings()
                    },
                    label: {
                        ButtonView(text: "Enable")
                            .padding()
                    }
                )
            }
        }
    }
}

#Preview {
    EnabledNotificationsView()
        .environmentObject(LocalNotificationManager())
}
