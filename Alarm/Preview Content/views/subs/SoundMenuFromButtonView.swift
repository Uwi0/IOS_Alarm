import SwiftUI

struct SoundMenuFromButtonView: View {
    @Binding var alarmModel: AlarmModel
    var body: some View {
        NavigationLink(
            destination: {
                SoundMenuView(alarmSound: $alarmModel.sound)
            },
            label: {
                HStack {
                    Text("Sound")
                        .fontWeight(.semibold)
                    Text(alarmModel.sound.rawValue.formatSoundName)
                        .font(.caption)
                        .fontWeight(.thin)
                }
                .padding(7)
                .overlay {
                    Capsule()
                        .stroke()
                }
            }
        )
    }
}

#Preview {
    NavigationStack {
        SoundMenuFromButtonView(alarmModel: .constant(.DefaultAlarm()))
    }
}
