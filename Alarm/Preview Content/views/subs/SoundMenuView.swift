import SwiftUI

struct SoundMenuView: View {
    @Binding var alarmSound: Sounds
    var body: some View {
        Form {
            Section(header: Text("Ringtone Sounds")) {
                ForEach(ringToneSoundsList, id: \.self) { item in
                    Button(
                        action: {
                            alarmSound = item
                            playSound(sound: item.rawValue)
                        },
                        label: {
                            HStack {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(purple)
                                    .fontWeight(.semibold)
                                    .opacity(alarmSound == item ? 1.0 : 0.0)
                                
                                Text(item.rawValue.formatSoundName)
                                    .foregroundStyle(black)
                                    .fontWeight(.semibold)
                            }
                        }
                    )
                }
            }
            Section(header: Text("Alarm Sounds")) {
                ForEach(natureSoundsList, id: \.self) { item in
                    Button(
                        action: {
                            alarmSound = item
                            playSound(sound: item.rawValue)
                        },
                        label: {
                            HStack {
                                Image(systemName: "checkmark")
                                    .foregroundStyle(purple)
                                    .fontWeight(.semibold)
                                    .opacity(alarmSound == item ? 1.0 : 0.0)
                                
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
}

#Preview {
    SoundMenuView(alarmSound: .constant(AlarmModel.DefaultAlarm().sound))
}
