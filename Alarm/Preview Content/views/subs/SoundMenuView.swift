import SwiftUI

struct SoundMenuView: View {
    @Binding var alarmSound: Sounds
    var body: some View {
        Form {
            ButtonSectionView(
                title: "Ringtone Sounds",
                sounds: ringToneSoundsList,
                selectedSound: $alarmSound
            )
            ButtonSectionView(
                title: "Alarm Sounds",
                sounds: natureSoundsList,
                selectedSound: $alarmSound
            )
        }
        .onDisappear {
            stopSound()
        }
    }
}

private struct ButtonSectionView: View {
    
    let title: LocalizedStringKey
    let sounds: [Sounds]
    @Binding var selectedSound: Sounds
    
    var body: some View {
        Section(header: Text(title)) {
            ForEach(sounds, id: \.self) { item in
                Button(
                    action: {
                        selectedSound = item
                        playSound(sound: item.rawValue)
                    },
                    label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundStyle(purple)
                                .fontWeight(.semibold)
                                .opacity(selectedSound == item ? 1.0 : 0.0)
                            
                            Text(item.rawValue.formatSoundName)
                                .foregroundStyle(black)
                                .fontWeight(.semibold)
                        }
                    }
                )
            }
        }
    }
}

#Preview {
    SoundMenuView(alarmSound: .constant(AlarmModel.DefaultAlarm().sound))
}
