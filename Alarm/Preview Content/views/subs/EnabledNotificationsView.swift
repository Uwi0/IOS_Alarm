import SwiftUI

struct EnabledNotificationsView: View {
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
}
