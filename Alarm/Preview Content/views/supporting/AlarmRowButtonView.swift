import SwiftUI

struct AlarmRowButtonView: View {
    let index: Int
    let onClick: (_ index: Int) -> Void
    var body: some View {
        Button(
            action: { onClick(index)},
            label: {
                AlarmRowView(index: index)
            }
        )
    }
}

#Preview {
    AlarmRowButtonView(index: 0, onClick: { _ in })
        .environmentObject(LocalNotificationManager())
}
